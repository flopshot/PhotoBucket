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
@testable import Photorama

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
        let resultFoto = Foto()
        resultFoto.photoID = "1"
        resultFoto.title = "Hi"
        resultFoto.dateTaken = Date()
        resultFoto.photoPath = "path/to/foto"
        resultFoto.urlString = "url.string"
        
        stub(photosRepo) { stub in
            when(stub.getPhotos()).thenReturn(Observable.just([resultFoto]))
        }
        
        // ACT
        let photosObservable = self.photosListViewModel.getPhotosObservable()
        
        // ASSERT
        XCTAssertEqual(try photosObservable.toBlocking().first(), [resultFoto])
    }
    
    func testFetchPhotos() {
        // ARRANGE
        let resultFoto = Foto()
        resultFoto.photoID = "1"
        resultFoto.title = "Hi"
        resultFoto.dateTaken = Date()
        resultFoto.photoPath = "path/to/foto"
        resultFoto.urlString = "url.string"
        
        stub(self.photosRepo) { stub in
            when(stub.fetchPhotos()).thenReturn(Observable.just(resultFoto))
        }
        
        stub(self.realmManager) { stub in
            when(stub.insert(any(Foto.self))).then { foto in
                print(foto)
            }
        }
        
        // ACT
        _ = photosListViewModel.fetchPhotos()
        
        // ASSERT
        verify(realmManager).insert(resultFoto)
    }

}
