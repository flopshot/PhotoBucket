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
    func getPhotos() -> Observable<[Photo]>
    func getPhoto(_ photoId: String) -> Observable<Photo>
    func fetchPhotos() -> Observable<Photo>
}

class PhotosRepoImpl: PhotosRepo {
    
    private let photoramaApi: PhotoramaApi
    private let realmManager: RealmManager
    
    required init(_ photoramaApi: PhotoramaApi, _ realmManager: RealmManager) {
        self.photoramaApi = photoramaApi
        self.realmManager = realmManager
    }
    
    func fetchPhotos() -> Observable<Photo> {
        return photoramaApi
            .fetchPhotos()
            .flatMap { (photos: [Photo]) throws -> Observable<Photo> in
                Observable.from(photos)
            }
    }
    
    func getPhotos() -> Observable<[Photo]> {
        let results = realmManager.getPhotos()
        return Observable.array(from: results, synchronousStart: false)
    }
    
    func getPhoto(_ photoId: String) -> Observable<Photo> {
        let result = realmManager.getPhoto(photoId)
        return Observable.changeset(from: result, synchronousStart: false)
            .map { (update) in
                return update.0.first ?? Photo()
            }
    }
}
