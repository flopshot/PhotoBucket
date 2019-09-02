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
    func fetchPhotos() -> Observable<[Photo]>
}

class PhotoramaApiImpl: PhotoramaApi {
    
    private let photosProcessor: PhotosProcessor
    private let baseURLString = "https://api.flickr.com/services/rest"
    private let apiKey = "a6d819499131071f158fd740860a5a88"
    
    required init(_ photosProcessor: PhotosProcessor) {
        self.photosProcessor = photosProcessor
    }
    
    func fetchPhotos() -> Observable<[Photo]> {
        return RxAlamofire.requestJSON(.get, flickrURL())
            .map({[weak self] (r, json) in
                guard let processor = self?.photosProcessor else {
                    throw PhotoramaError.invalidJSONData
                }
                return try! processor.processPhotos(json)
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

enum PhotoramaError: Error {
    case invalidJSONData
}

enum FlickrError: Error {
    case invalidJSONData
}

enum Method: String {
    case interestingPhotos = "flickr.interestingness.getList"
}
