//
//  RealmManager.swift
//  Photorama
//
//  Created by Sean Najera on 9/2/19.
//  Copyright © 2019 Sean Najera. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager {
    func insert(_ photo: Photo) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(photo, update: Realm.UpdatePolicy.modified)
        }
    }
    
    func getPhoto(_ photoId: String) -> Results<Photo> {
        let resultPhoto = try! Realm().objects(Photo.self).filter("photoId = '\(photoId)'")
        return resultPhoto
    }
    
    func getPhotos() -> Results<Photo> {
        let realm = try! Realm()
        let resultPhotos = realm.objects(Photo.self).sorted(byKeyPath: "dateTaken", ascending: false)
        return resultPhotos
    }
}
