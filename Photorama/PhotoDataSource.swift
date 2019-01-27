//
//  PhotoDataSource.swift
//  Photorama
//
//  Created by Sean Najera on 1/22/19.
//  Copyright © 2019 Sean Najera. All rights reserved.
//

import UIKit

// The the adapter of the collection view/recyclerview
class PhotoDataSource: NSObject, UICollectionViewDataSource {
    var photos = [Photo]()

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let id = "PhotoCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as! PhotoCell
        return cell
    }
    
}
