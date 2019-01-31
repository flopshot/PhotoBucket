//
//  PhotoCollectionViewCell.swift
//  Photorama
//
//  Created by Sean Najera on 1/22/19.
//  Copyright © 2019 Sean Najera. All rights reserved.
//

import UIKit
import RxSwift

// View holder of photos for collection view
class PhotoCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    let disposeBag = DisposeBag()
    
    private var viewModel: PhotoDetailViewModel! 
    
    func update(with foto: Foto) {
        viewModel.getImage(photo: foto)
        .distinctUntilChanged()
        .subscribe(onNext: {[weak self] image in
            self?.imageView.image = image
            if image == nil {
                self?.spinner.startAnimating()
            } else {
                self?.spinner.stopAnimating()
            }
        }, onError: {e in
            print(e)
        }, onCompleted: {
            print("Completed Observable")
        }, onDisposed: {
            print("Observable Disposed")
        }).disposed(by: disposeBag)
    }
    
    func setViewModel(_ viewModel: PhotoDetailViewModel?) {
        if self.viewModel == nil {
            self.viewModel = viewModel
        }
    }
}
