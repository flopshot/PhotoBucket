//
//  ViewController.swift
//  Photorama
//
//  Created by Sean Najera on 1/21/19.
//  Copyright © 2019 Sean Najera. All rights reserved.
//

import UIKit
import RxSwift
import RealmSwift
import RxCocoa
import RxRealm
import RxRealmDataSources

class PhotosViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    var viewModel: PhotosListViewModel!
    var photosRepo: PhotosRepo!
    let photoDataSource = PhotoDataSource()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dataSource = RxCollectionViewRealmDataSource<Foto>(cellIdentifier: "PhotoCell", cellType: PhotoCell.self) {[weak self] cell, indexPath, foto in
            if let repo = self?.photosRepo {
                cell.setViewModel(PhotoDetailViewModel(repo))
            }
            cell.update(with: foto)
        }
        
        viewModel.fetchPhotos().disposed(by: disposeBag)
        
        viewModel.getPhotosObservable()
            .bind(to: collectionView.rx.realmChanges(dataSource))
            .disposed(by: disposeBag)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showPhoto"?:
            if let selectedIndexPath = collectionView.indexPathsForSelectedItems?.first {
                let foto = viewModel.getPhoto(at: selectedIndexPath.row)
                let destinationVC = segue.destination as! PhotoInfoViewConrtroller
                destinationVC.foto = foto
                destinationVC.viewModel = PhotoDetailViewModel(photosRepo)
            }
        default:
            preconditionFailure("Unexpected segue identifier")
        }
    }
}
