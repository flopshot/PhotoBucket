//
//  Foto.swift
//  Photorama
//
//  Created by Sean Najera on 1/27/19.
//  Copyright © 2019 Sean Najera. All rights reserved.
//

import Foundation
import RealmSwift

class Foto: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var photoID: String = ""
    @objc dynamic var urlString: String = ""
    @objc dynamic var dateTaken: Date = Date()
    var url: URL {
        return URL(string: urlString)!
    }
    
    override static func primaryKey() -> String {
        return "photoID"
    }
    
    override static func ignoredProperties() -> [String] {
        return ["url"]
    }
}
