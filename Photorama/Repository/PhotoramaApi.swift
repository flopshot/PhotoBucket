//
//  PhotoramaApi.swift
//  Photorama
//
//  Created by Sean Najera on 1/27/19.
//  Copyright © 2019 Sean Najera. All rights reserved.
//

import Foundation
import RxSwift
import UIKit
import Alamofire
import RxAlamofire

protocol PhotoramaApi {
    func fetchPhotos() -> Observable<[Foto]>
}

class PhotoramaApiImpl: PhotoramaApi {
    
    private let fotosProcessor: FotosProcessor
    private let baseURLString = "https://api.flickr.com/services/rest"
    private let apiKey = "a6d819499131071f158fd740860a5a88"
    
    required init(_ fotosProcessor: FotosProcessor) {
        self.fotosProcessor = fotosProcessor
    }
    
    func fetchPhotos() -> Observable<[Foto]> {
        return RxAlamofire.requestJSON(.get, flickrURL())
            .map({[weak self] (r, json) in
                guard let processor = self?.fotosProcessor else {
                    throw PhotoramaError.invalidJSONData
                }
                return try! processor.processFotos(json)
            })
    }
    
    private func flickrURL() -> String {
        var components = URLComponents(string: baseURLString)!
        var queryItems = [URLQueryItem]()
        
        let baseParams = [
            "method" : Method.interestingPhotos.rawValue,
            "format" : "json",
            "nojsoncallback" : "1",
            "api_key" : apiKey,
            "extras": "url_h,date_taken"
        ]
        
        for (key, val) in baseParams {
            queryItems.append(URLQueryItem(name: key, value: val))
        }
        
        components.queryItems = queryItems
        return components.url?.absoluteString ?? ""
    }
}

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

enum PhotoramaError: Error {
    case invalidJSONData
}

enum FlickrError: Error {
    case invalidJSONData
}

enum Method: String {
    case interestingPhotos = "flickr.interestingness.getList"
}
