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
    func insert(_ foto: Foto) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(foto, update: Realm.UpdatePolicy.modified)
        }
    }
    
    func getFoto(_ photoId: String) -> Results<Foto> {
        let resultFoto = try! Realm().objects(Foto.self).filter("photoID = '\(photoId)'")
        return resultFoto
    }
    
    func getFotos() -> Results<Foto> {
        let realm = try! Realm()
        let resultFotos = realm.objects(Foto.self).sorted(byKeyPath: "dateTaken", ascending: false)
        return resultFotos
    }
}
