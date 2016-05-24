//
//  PhotosListAssembly.swift
//  VKPhotoViewer
//
//  Created by Starikov Yevgeny on 23/05/2016.
//  Copyright © 2016 StarikovEvgen. All rights reserved.
//

import UIKit

class PhotosListAssembly
{
    class func createModule() -> PhotosListModuleInput
    {
        let presenter = PhotosListPresenter()
        let vc = initializeViewController()
        let interactor = PhotosListInteractor()
        let router = PhotosListRouter()
        
        presenter.view = vc
        presenter.interactor = interactor
        presenter.router = router
        
        vc.output = presenter
        interactor.output = presenter
        
        router.presenter = presenter
        router.viewController = vc
        
        presenter.photoScreen = PhotoScreenAssembly.createModule()
        
        return presenter
    }
    
    private class func initializeViewController() -> PhotosListViewController {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewControllerWithIdentifier("PhotosListViewController") as! PhotosListViewController
        
        return vc
    }
}
