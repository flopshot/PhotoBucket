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
    func getPhotos() -> Observable<[Foto]>
    func getPhoto(_ photoId: String) -> Observable<Foto>
    func fetchPhotos() -> Observable<Foto>
}

class PhotosRepoImpl: PhotosRepo {
    
    private let photoramaApi: PhotoramaApi
    private let realmManager: RealmManager
    
    required init(_ photoramaApi: PhotoramaApi, _ realmManager: RealmManager) {
        self.photoramaApi = photoramaApi
        self.realmManager = realmManager
    }
    
    func fetchPhotos() -> Observable<Foto> {
        return photoramaApi
            .fetchPhotos()
            .flatMap { (fotos: [Foto]) throws -> Observable<Foto> in
                Observable.from(fotos)
            }
    }
    
    func getPhotos() -> Observable<[Foto]> {
        let results = realmManager.getFotos()
        return Observable.array(from: results, synchronousStart: false)
    }
    
    func getPhoto(_ photoId: String) -> Observable<Foto> {
        let result = realmManager.getFoto(photoId)
        return Observable.changeset(from: result, synchronousStart: false)
            .map { (update) in
                return update.0.first ?? Foto()
            }
    }
}
