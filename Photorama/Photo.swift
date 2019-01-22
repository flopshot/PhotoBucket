//
//  Photo.swift
//  Photorama
//
//  Created by Sean Najera on 1/21/19.
//  Copyright © 2019 Sean Najera. All rights reserved.
//

import Foundation

class Photo {
    
    let title: String
    let remoteUrl: URL
    let photoID: String
    let dateTaken: Date
    
    init(title: String, photoID: String, remoteURL: URL, dateTaken: Date) {
        self.title = title
        self.photoID = photoID
        self.remoteUrl = remoteURL
        self.dateTaken = dateTaken
    }
}
