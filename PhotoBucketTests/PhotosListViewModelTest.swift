//
//  PhotosListViewModelTests.swift
//  PhotosListViewModelTests
//
//  Created by Sean Najera on 1/21/19.
//  Copyright © 2019 Sean Najera. All rights reserved.
//

import XCTest
import Cuckoo
import RxSwift
import RxBlocking
@testable import PhotoBucket

class PhotosListViewModelTests: XCTestCase {
    
    // SUT
    var photosListViewModel: PhotosListViewModel!
    
    // Dependencies
    let photosRepo = MockPhotosRepo()
    let realmManager = MockRealmManager()

    override func setUp() {
        super.setUp()
        self.photosListViewModel = PhotosListViewModel(self.photosRepo, self.realmManager)
    }
    
    func testGetPhotosObservable() {
        
        // ARRANGE
        let resultPhoto = Photo()
        resultPhoto.photoId = "1"
        resultPhoto.title = "Hi"
        resultPhoto.dateTaken = Date()
        resultPhoto.photoPath = "path/to/foto"
        resultPhoto.urlString = "url.string"
        
        stub(photosRepo) { stub in
            when(stub.getPhotos()).thenReturn(Observable.just([resultPhoto]))
        }
        
        // ACT
        let photosObservable = self.photosListViewModel.getPhotosObservable()
        
        // ASSERT
        XCTAssertEqual(try photosObservable.toBlocking().first(), [resultPhoto])
    }
    
    func testFetchPhotos() {
        // ARRANGE
        let resultPhoto = Photo()
        resultPhoto.photoId = "1"
        resultPhoto.title = "Hi"
        resultPhoto.dateTaken = Date()
        resultPhoto.photoPath = "path/to/foto"
        resultPhoto.urlString = "url.string"
        
        stub(self.photosRepo) { stub in
            when(stub.fetchPhotos()).thenReturn(Observable.just(resultPhoto))
        }
        
        stub(self.realmManager) { stub in
            when(stub.insert(any(Photo.self))).then { photo in
                print(photo)
            }
        }
        
        // ACT
        _ = photosListViewModel.fetchPhotos()
        
        // ASSERT
        verify(realmManager).insert(resultPhoto)
    }

}
