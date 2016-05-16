//
//  AlbumListAssembly.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 13.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import UIKit

class AlbumListAssembly
{
    class func createModule(mediator: Mediator) -> AlbumListModuleInput
    {
        let presenter = AlbumListPresenter(mediator: mediator)
        let vc = initializeViewController()
        let interactor = AlbumListInteractor()
        let router = AlbumListRouter()
        
        presenter.view = vc
        presenter.interactor = interactor
        presenter.router = router
        
        vc.output = presenter
        interactor.output = presenter
        
        router.presenter = presenter
        router.viewController = vc
        
        // Dependences on the services
        interactor.httpString = HttpStringService()
        interactor.parseDataAPI = ParseDataService()
        interactor.serverAPI = ServerManager()
        
        //mediator pattern
        mediator.addPresenterOfModules(presenter)
        
        presenter.photosListScreen = PhotosListAssembly.createModule(mediator)
        
        return presenter
    }
    
    private class func initializeViewController() -> AlbumListViewController {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewControllerWithIdentifier("AlbumListViewController") as! AlbumListViewController
        
        return vc
    }
}
