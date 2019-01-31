//
//  ImageCache.swift
//  Photorama
//
//  Created by Sean Najera on 1/27/19.
//  Copyright © 2019 Sean Najera. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

protocol ImageCache {
    func add(_ image: UIImage!,_ withIdentifier: String)
    func image(_ withIdentifier: String) -> UIImage!
}

class AFImageCache: ImageCache {
    
    let afiCache: AutoPurgingImageCache
    
    required init(_ cache: AutoPurgingImageCache) {
        self.afiCache = cache
    }
    
    func add(_ image: UIImage!, _ withIdentifier: String) {
        afiCache.add(image, withIdentifier: withIdentifier)
    }
    
    func image(_ withIdentifier: String) -> UIImage! {
        return afiCache.image(withIdentifier: withIdentifier)
    }
}
