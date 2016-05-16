//
//  LoginScreenAssembly.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 11.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import UIKit

class LoginScreenAssembly
{
    class func createModule() -> LoginScreenModuleInput
    {
        let mediator = Mediator()
        let presenter = LoginScreenPresenter(mediator: mediator)
        let vc = initializeViewController()
        let interactor = LoginScreenInteractor()
        let router = LoginScreenRouter()
        
        presenter.view = vc
        presenter.interactor = interactor
        presenter.router = router
        
        vc.output = presenter
        interactor.output = presenter

        router.presenter = presenter
        router.viewController = vc
        
        //mediator pattern
        mediator.addPresenterOfModules(presenter)
        
        presenter.albumListScreen = AlbumListAssembly.createModule(mediator)
        
        return presenter
    }
    
    private class func initializeViewController() -> LoginScreenViewController {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewControllerWithIdentifier("LoginScreenViewController") as! LoginScreenViewController
        
        return vc
    }
}