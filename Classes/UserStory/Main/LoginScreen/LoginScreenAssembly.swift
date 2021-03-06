//
//  LoginScreenAssembly.swift
//  VKPhotoViewer
//
//  Created by Starikov Yevgeny on 23/05/2016.
//  Copyright © 2016 StarikovEvgen. All rights reserved.
//

import UIKit

class LoginScreenAssembly 
{
    class func createModule() -> LoginScreenModuleInput
    {
        let presenter = LoginScreenPresenter()
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
        
        presenter.albumListScreen = AlbumListAssembly.createModule()
        
        return presenter
    }
    
    private class func initializeViewController() -> LoginScreenViewController {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewControllerWithIdentifier("LoginScreenViewController") as! LoginScreenViewController
        
        return vc
    }
}






