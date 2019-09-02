//
//  AppDelegate.swift
//  Photorama
//
//  Created by Sean Najera on 1/21/19.
//  Copyright © 2019 Sean Najera. All rights reserved.
//

import UIKit
import AlamofireImage

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        UIImageView.af_sharedImageDownloader = ImageDownloader(
            configuration: ImageDownloader.defaultURLSessionConfiguration(),
            maximumActiveDownloads: 100,
            imageCache: AutoPurgingImageCache(
                memoryCapacity: 900 * 1024 * 1024,
                preferredMemoryUsageAfterPurge: 600 * 1024 * 1024
            )
        )
        
        let rootViewController = window!.rootViewController as! UINavigationController
        let photosViewController = rootViewController.topViewController as! PhotosViewController

        let repo = PhotosRepoImpl(PhotoramaApiImpl(PhotosProcessorImpl()), RealmManager())
        photosViewController.viewModel = PhotosListViewModel(repo, RealmManager())
        
        return true
    }
}



