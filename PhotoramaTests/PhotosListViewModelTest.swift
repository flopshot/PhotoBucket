//
//  PhotosListViewModelTests.swift
//  PhotosListViewModelTests
//
//  Created by Sean Najera on 1/21/19.
//  Copyright © 2019 Sean Najera. All rights reserved.
//

import XCTest
@testable import Photorama

class PhotosListViewModelTests: XCTestCase {
    
    // SUT
    var photosListViewModel: PhotosListViewModel!
    
    // Dependencies
    var photosRepo: PhotosRepo!

    override func setUp() {
        super.setUp()
        self.photosRepo = MockPhotosRepo()
        self.photosListViewModel = PhotosListViewModel(self.photosRepo)
    }
    
    func testPhotosListViewModelNotNil() {
        XCTAssertNotNil(self.photosListViewModel)
    }

}
