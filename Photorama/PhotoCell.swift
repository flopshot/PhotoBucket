//
//  PhotoCollectionViewCell.swift
//  Photorama
//
//  Created by Sean Najera on 1/22/19.
//  Copyright © 2019 Sean Najera. All rights reserved.
//

import UIKit

// View holder of photos for collection view
class PhotoCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    
    func update(with image: UIImage?) {
        if let imageToDisplay = image {
            spinner.stopAnimating()
            imageView.image = imageToDisplay
        } else {
            spinner.startAnimating()
            imageView.image = nil
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        update(with: nil)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        update(with: nil)
    }
}
