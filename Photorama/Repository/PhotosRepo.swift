//
//  PhotosRepo.swift
//  Photorama
//
//  Created by Sean Najera on 1/27/19.
//  Copyright © 2019 Sean Najera. All rights reserved.
//

import Foundation
import RxSwift
import UIKit
import RxRealm
import RealmSwift

protocol PhotosRepo {
    func getPhotos() -> Observable<(AnyRealmCollection<Foto>, RealmChangeset?)>
    func getPhoto(_ photoId: String) -> Observable<Foto>
    func getPhotoImage(_ photo: Foto) -> Observable<UIImage?>
    func fetchPhotos() -> Observable<[Foto]>
}

class PhotosRepoImpl: PhotosRepo {
    
    private let imageCache: ImageCache
    private let photoramaApi: PhotoramaApi
    
    required init(_ imageCache: ImageCache, _ photoramaApi: PhotoramaApi) {
        self.imageCache = imageCache
        self.photoramaApi = photoramaApi
    }
    
    func fetchPhotos() -> Observable<[Foto]> {
        return photoramaApi.fetchPhotos()
    }
    
    func getPhotos() -> Observable<(AnyRealmCollection<Foto>, RealmChangeset?)> {
        let realm = try! Realm()
        let results = realm.objects(Foto.self).sorted(byKeyPath: "dateTaken", ascending: false)
        return Observable.changeset(from: results)
    }
    
    func getPhoto(_ photoId: String) -> Observable<Foto> {
        let result = try! Realm().objects(Foto.self).filter("photoID = '\(photoId)'")
        return Observable.changeset(from: result, synchronousStart: false)
            .map { (update) in
                return update.0.first ?? Foto()
            }
    }
    
    func getPhotoImage(_ photo: Foto) -> Observable<UIImage?> {
        return Observable.just(imageCache.image(photo.photoID))
            .flatMap{ [weak self] (imageOptional: UIImage?) throws -> Observable<UIImage?> in
                if imageOptional != nil {
                    return Observable.just(imageOptional)
                } else {
                    guard let imageObservable = self?.photoramaApi
                            .fetchImage(photo.url.absoluteString)
                            .do(onNext: {[weak self] image in self?.imageCache.add(image, photo.photoID)}) else {
                        return Observable.just(nil)
                    }
                    return imageObservable
                }
            }
    }
}
