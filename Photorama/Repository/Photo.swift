//
//  Photo.swift
//  Photorama
//
//  Created by Sean Najera on 1/27/19.
//  Copyright © 2019 Sean Najera. All rights reserved.
//

import Foundation
import RealmSwift
import DeepDiff

class Photo: Object, NSCopying, DiffAware {
    var diffId: String {
        return self.photoId
    }
    
    static func compareContent(_ a: Photo, _ b: Photo) -> Bool {
        return a.isEqual(b)
    }
    
    @objc dynamic var title: String = ""
    @objc dynamic var photoId: String = ""
    @objc dynamic var urlString: String = ""
    @objc dynamic var photoPath: String? = nil
    @objc dynamic var dateTaken: Date? = nil
    var url: URL {
        if let url = URL(string: urlString) {
            return url
        } else {
            return URL(string: "https://pbs.twimg.com/media/DfKL_yPX4AAAaPG.jpg")!
        }
    }
    
    override static func primaryKey() -> String {
        return "photoId"
    }
    
    override static func ignoredProperties() -> [String] {
        return ["url"]
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let otherPhoto = object as? Photo else {
            return false
        }
        return otherPhoto.dateTaken == self.dateTaken &&
        otherPhoto.photoId == self.photoId &&
        otherPhoto.title == self.title &&
        otherPhoto.urlString == self.urlString &&
        otherPhoto.photoPath == self.photoPath
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let photo = Photo()
        photo.dateTaken = self.dateTaken
        photo.photoId = self.photoId
        photo.title = self.title
        photo.urlString = self.urlString
        photo.photoPath = self.photoPath
        return photo
    }
}
