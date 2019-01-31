//
//  PhotoDetailViewModel.swift
//  Photorama
//
//  Created by Sean Najera on 1/27/19.
//  Copyright © 2019 Sean Najera. All rights reserved.
//

import Foundation
import RxSwift
import UIKit

class PhotoDetailViewModel {
    
    private let photosRepo: PhotosRepo
    
    init(_ photosRepo: PhotosRepo) {
        self.photosRepo = photosRepo
    }
    
    func getPhotoObservable(photoId: String) -> Observable<Foto> {
        return photosRepo.getPhoto(photoId)
    }
    
    func getImage(photo: Foto) -> Observable<UIImage?> {
        return photosRepo.getPhotoImage(photo)
    }
}
