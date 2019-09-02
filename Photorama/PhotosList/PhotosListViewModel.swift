//
//  PhotosListViewModel.swift
//  Photorama
//
//  Created by Sean Najera on 1/27/19.
//  Copyright © 2019 Sean Najera. All rights reserved.
//

import Foundation
import RxSwift
import RxRealm
import RealmSwift

class PhotosListViewModel {
    
    private let photosRepo: PhotosRepo
    private let realmManager: RealmManager
    
    init(_ photosRepo: PhotosRepo, _ realmManager: RealmManager) {
        self.photosRepo = photosRepo
        self.realmManager = realmManager
    }
    
    func getPhotosObservable() -> Observable<[Foto]> {
        return photosRepo.getPhotos()
    }
    
    func fetchPhotos() -> Disposable {
        return photosRepo.fetchPhotos()
                .subscribe(onNext: { [weak self] (foto) in
                    self?.realmManager.insert(foto)
                })
    }
}
