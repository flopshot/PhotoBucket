//
//  PhotoInfoViewController.swift
//  Photorama
//
//  Created by Sean Najera on 1/23/19.
//  Copyright © 2019 Sean Najera. All rights reserved.
//

import UIKit

class PhotoInfoViewConrtroller: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    var photo: Photo! {
        didSet {
            navigationItem.title = photo.title
        }
    }
    
    var store: PhotoStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.fetchImage(for: photo) { (result) -> Void in
            switch result {
            case let .success(image):
                self.imageView.image = image
            case let .failure(error):
                print("Error fetching photo: \(error)")
            }
        }
    }
}
