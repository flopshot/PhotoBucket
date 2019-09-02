//
//  PhotoInfoViewController.swift
//  Photorama
//
//  Created by Sean Najera on 1/23/19.
//  Copyright © 2019 Sean Najera. All rights reserved.
//

import UIKit
import RxSwift

class PhotoInfoViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    private let disposeBag = DisposeBag()
    
    var photo: Photo! {
        didSet {
            navigationItem.title = photo.title
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.af_setImage(withURL: photo.url)
    }
}
