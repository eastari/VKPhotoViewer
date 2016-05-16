//
//  PhotosListAssembly.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 14.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import UIKit

class PhotosListAssembly
{
    class func createModule(mediator: Mediator) -> PhotosListModuleInput
    {
        let presenter = PhotosListPresenter(mediator: mediator)
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
        
        //mediator pattern
        mediator.addPresenterOfModules(presenter)
        
        presenter.photoScreen = PhotoScreenAssembly.createModule(mediator)
        
        return presenter
    }
    
    private class func initializeViewController() -> PhotosListViewController {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewControllerWithIdentifier("PhotosListViewController") as! PhotosListViewController
        
        return vc
    }
}

