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
import DeepDiff

class PhotosViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    var viewModel: PhotosListViewModel!
    private let dataSource = PhotosDataSource()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.dataSource = dataSource
        self.collectionView.delegate = self

        viewModel.getPhotosObservable()
                .subscribe(onNext: { [weak self] newFotos in
                    let changes = diff(old: (self?.collectionView.dataSource as! PhotosDataSource).getData(), new: newFotos)
                    self?.collectionView.reload(changes: changes, updateData: {
                        (self?.collectionView.dataSource as! PhotosDataSource).updateData(newFotos: newFotos)
                    })
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
        
        viewModel.fetchPhotos().disposed(by: disposeBag)
    }
}

extension PhotosViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        pushDetailViewController(indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let cell = cell as! PhotoCell
        cell.imageView.image = nil
        cell.imageView.af_setImage(withURL: dataSource.getFoto(at: indexPath.row).url)
    }

    private func pushDetailViewController(_ rowIndex: Int) {
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let detailViewController = storyBoard.instantiateViewController(withIdentifier: "PhotoInfoViewController") as! PhotoInfoViewController

        detailViewController.foto = (self.collectionView.dataSource as! PhotosDataSource).getFoto(at: rowIndex)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

class PhotosDataSource: NSObject, UICollectionViewDataSource {
    
    private var data: [Foto] = []
    
    func getData() -> [Foto] {
        return data
    }

    func updateData(newFotos data: [Foto]) {
        self.data = data.map{$0.copy() as! Foto}
    }

    func getFoto(at index: Int) -> Foto {
        return data[index]
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
}
