//
//  PhotoInfoViewController.swift
//  Photorama
//
//  Created by Sean Najera on 1/23/19.
//  Copyright © 2019 Sean Najera. All rights reserved.
//

import UIKit
import RxSwift

class PhotoInfoViewConrtroller: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    var viewModel: PhotoDetailViewModel!
    private let disposeBag = DisposeBag()
    
    var foto: Foto! {
        didSet {
            navigationItem.title = foto.title
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getImage(photo: foto)
            .distinctUntilChanged()
            .subscribe(onNext: { [weak self] imageOptional in
                    if let image: UIImage = imageOptional {
                        self?.imageView.image = image
                    } else {
                        print("Error fetching photo: photo is nil")
                    }
                },
                onError: { error in
                    print("Error fetching photo: \(error)")
                },
                onCompleted: {
                    print("Detail View Image Fetch Complete")
                },
                onDisposed: {
                    print("Detail View Image Fetch Observable Disposed")
            })
            .disposed(by: disposeBag)
    }
}
