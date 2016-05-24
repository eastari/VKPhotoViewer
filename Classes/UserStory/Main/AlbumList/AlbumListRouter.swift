//
//  AlbumListRouter.swift
//  VKPhotoViewer
//
//  Created by Starikov Yevgeny on 23/05/2016.
//  Copyright © 2016 StarikovEvgen. All rights reserved.
//

import Foundation

class AlbumListRouter: AlbumListRouterInput
{
    
    var navigationController: UINavigationController!
    var presenter: AlbumListPresenter!
    weak var viewController: UIViewController?
    
    
    func present(fromWindow window: UIWindow) {
        if let controller = viewController {
            navigationController = UINavigationController(rootViewController: controller)
            navigationController.setNavigationBarHidden(true, animated: true)
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
    }
    
    func controller() -> UIViewController? {
        
        return viewController
    }
    
    func dismiss() {
        if let nc = viewController?.navigationController {
            nc.popViewControllerAnimated(true)
        }
    }
    
    
    func presentPhotosList(album: [PhotosDomainModel]) {
        if let nc = viewController?.navigationController {
            if let photosListController = presenter.photosListScreen.controller() {
                nc.pushViewController(photosListController, animated: true)
                presenter.photosListScreen.downloadWithAlbum(album)
            }
            
        }
        
    }
    
}