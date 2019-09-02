//
//  FotosProcessor.swift
//  Photorama
//
//  Created by Sean Najera on 9/2/19.
//  Copyright © 2019 Sean Najera. All rights reserved.
//

import Foundation

protocol FotosProcessor {
    func processFotos(_ json: Any) throws -> [Foto]
}

class FotosProcessorImpl: FotosProcessor {
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
    
    func processFotos(_ json: Any) throws -> [Foto] {
        guard
            let jsonDictionary = json as? [AnyHashable:Any],
            let photos = jsonDictionary["photos"] as? [String:Any],
            let photosArray = photos["photo"] as? [[String:Any]] else {
                throw PhotoramaError.invalidJSONData
        }
        
        var finalPhotos = [Foto]()
        for json in photosArray {
            guard
                let title = json["title"] as? String,
                let photoID = json["id"] as? String,
                let dateString = json["datetaken"] as? String,
                let photoURLString = json["url_h"] as? String,
                let dateTaken = self.dateFormatter.date(from: dateString) else {
                    continue
            }
            let foto = Foto()
            foto.dateTaken = dateTaken
            foto.photoID = photoID
            foto.title = title
            foto.urlString = photoURLString
            finalPhotos.append(foto)
        }
        return finalPhotos
    }
}
