//
//  PhotosProcessor.swift
//  Photorama
//
//  Created by Sean Najera on 9/2/19.
//  Copyright © 2019 Sean Najera. All rights reserved.
//

import Foundation

protocol PhotosProcessor {
    func processPhotos(_ json: Any) throws -> [Photo]
}

class PhotosProcessorImpl: PhotosProcessor {
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
    
    func processPhotos(_ json: Any) throws -> [Photo] {
        guard
            let jsonDictionary = json as? [AnyHashable:Any],
            let photos = jsonDictionary["photos"] as? [String:Any],
            let photosArray = photos["photo"] as? [[String:Any]] else {
                throw PhotoramaError.invalidJSONData
        }
        
        var finalPhotos = [Photo]()
        for json in photosArray {
            guard
                let title = json["title"] as? String,
                let photoId = json["id"] as? String,
                let dateString = json["datetaken"] as? String,
                let photoURLString = json["url_h"] as? String,
                let dateTaken = self.dateFormatter.date(from: dateString) else {
                    continue
            }
            let photo = Photo()
            photo.dateTaken = dateTaken
            photo.photoId = photoId
            photo.title = title
            photo.urlString = photoURLString
            finalPhotos.append(photo)
        }
        return finalPhotos
    }
}
