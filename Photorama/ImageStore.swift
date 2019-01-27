//
//  ImageStore.swift
//  Photorama
//
//  Created by Sean Najera on 1/23/19.
//  Copyright © 2019 Sean Najera. All rights reserved.
//

import UIKit

// Cache for the photos
class ImageStore {
    let cache = NSCache<NSString,UIImage>()
    
    func setImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
        
        let url = imageURL(forKey: key)
        if let data = image.jpegData(compressionQuality: 0.5) {
            let _ = try? data.write(to: url, options: [.atomic])
        }
    }
    
    func image(forKey key: String) -> UIImage? {
        if let existingImage = cache.object(forKey: key as NSString) {
            return existingImage
        }
        
        let url = imageURL(forKey: key)
        guard let imageFromDisk = UIImage(contentsOfFile: url.path) else {
            return nil
        }
        
        cache.setObject(imageFromDisk, forKey: key as NSString)
        return imageFromDisk
    }
    
    func deleteImage(forKey key: String) {
        cache.removeObject(forKey: key as NSString)
        
        let url = imageURL(forKey: key)
        do {
            try FileManager.default.removeItem(at: url)
        } catch {
            print("Error removing image from dist: \(error)")
        }
        
    }
    
    func imageURL(forKey key: String) -> URL {
        let doumentsDirs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docDir = doumentsDirs.first!
        return docDir.appendingPathComponent(key)
    }
}
