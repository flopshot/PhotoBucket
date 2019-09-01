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
    
    init(_ photosRepo: PhotosRepo) {
        self.photosRepo = photosRepo
    }
    
    func getPhotosObservable() -> Observable<[Foto]> {
        return photosRepo.getPhotos()
    }
    
    func fetchPhotos() -> Disposable {
        return photosRepo.fetchPhotos()
                .subscribe(onNext: { (foto) in
                    let realm = try! Realm()
                    try! realm.write {
                        realm.add(foto, update: Realm.UpdatePolicy.modified)
                    }
                })
    }
}
