//
//  LoginScreenRouter.swift
//  VKPhotoViewer
//
//  Created by Starikov Yevgeny on 23/05/2016.
//  Copyright © 2016 StarikovEvgen. All rights reserved.
//

import UIKit

class LoginScreenRouter: ViperRouter, LoginScreenRouterInput 
{
    var navigationController: UINavigationController!
    var presenter: LoginScreenPresenter!
    weak var viewController: UIViewController?
    
    func present(fromWindow window: UIWindow)
    {
        if let controller = viewController {
            navigationController = UINavigationController(rootViewController: controller)
            navigationController.setNavigationBarHidden(true, animated: true)
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
    }
    
    func presentAlbumList(user: User)
    {
        if let albumListController = presenter.albumListScreen.controller() {
            navigationController.pushViewController(albumListController, animated: true)
            presenter.albumListScreen.downloadWithUser(user)
            
        }
    }

}

