//
//  MockPhotosRepo.swift
//  PhotoramaTests
//
//  Created by Sean Najera on 9/1/19.
//  Copyright © 2019 Sean Najera. All rights reserved.
//

import Foundation
import RxSwift

@testable import Photorama

class MockPhotosRepo: PhotosRepo {
    func getPhotos() -> Observable<[Foto]> {
        return Observable.just([Foto()])
    }
    
    func getPhoto(_ photoId: String) -> Observable<Foto> {
        return Observable.just(Foto())
    }
    
    func fetchPhotos() -> Observable<Foto> {
        return Observable.just(Foto())
    }
    
}
