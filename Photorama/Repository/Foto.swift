//
//  Foto.swift
//  Photorama
//
//  Created by Sean Najera on 1/27/19.
//  Copyright © 2019 Sean Najera. All rights reserved.
//

import Foundation
import RealmSwift
import DeepDiff

class Foto: Object, NSCopying, DiffAware {
    var diffId: String {
        return self.photoID
    }
    
    static func compareContent(_ a: Foto, _ b: Foto) -> Bool {
        return a.isEqual(b)
    }
    
    @objc dynamic var title: String = ""
    @objc dynamic var photoID: String = ""
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
        return "photoID"
    }
    
    override static func ignoredProperties() -> [String] {
        return ["url"]
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let otherFoto = object as? Foto else {
            return false
        }
        return otherFoto.dateTaken == self.dateTaken &&
        otherFoto.photoID == self.photoID &&
        otherFoto.title == self.title &&
        otherFoto.urlString == self.urlString &&
        otherFoto.photoPath == self.photoPath
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let foto = Foto()
        foto.dateTaken = self.dateTaken
        foto.photoID = self.photoID
        foto.title = self.title
        foto.urlString = self.urlString
        foto.photoPath = self.photoPath
        return foto
    }
}
