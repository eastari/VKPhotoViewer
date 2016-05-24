//
//  PhotoScreenRouter.swift
//  VKPhotoViewer
//
//  Created by Starikov Yevgeny on 23/05/2016.
//  Copyright © 2016 StarikovEvgen. All rights reserved.
//

import Foundation

class PhotoScreenRouter: PhotoScreenRouterInput
{
    
    var navigationController: UINavigationController!
    var presenter: PhotoScreenPresenter!
    weak var viewController: UIViewController?
    
    
    func controller() -> UIViewController? {
        
        return viewController
    }
    
    func dismiss() {
        if let nc = viewController?.navigationController {
            nc.popViewControllerAnimated(true)
        }
    }
    
}