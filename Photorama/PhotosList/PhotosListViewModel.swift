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
    private var currentFotos: [Foto] = []
    
    func getPhoto(at index: Int) -> Foto? {
        if 0 <= index && index < currentFotos.count {
            return currentFotos[index]
        } else {
            return nil
        }
    }
    
    init(_ photosRepo: PhotosRepo) {
        self.photosRepo = photosRepo
    }
    
    func getPhotosObservable() -> Observable<(AnyRealmCollection<Foto>, RealmChangeset?)> {
        return photosRepo.getPhotos()
    }
    
    func fetchPhotos() -> Disposable {
        return photosRepo.fetchPhotos()
            .do(onNext: { [weak self] fotos in
                self?.currentFotos = fotos
            })
            .subscribe(Realm.rx.add(update: true))
    }
}
