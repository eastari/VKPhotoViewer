//
//  PhotoScreenAssembly.swift
//  VKPhotoViewer
//
//  Created by Starikov Yevgeny on 23/05/2016.
//  Copyright © 2016 StarikovEvgen. All rights reserved.
//

import UIKit

class PhotoScreenAssembly
{
    class func createModule() -> PhotoScreenModuleInput
    {
        let presenter = PhotoScreenPresenter()
        let vc = initializeViewController()
        let interactor = PhotoScreenInteractor()
        let router = PhotoScreenRouter()
        
        presenter.view = vc
        presenter.interactor = interactor
        presenter.router = router
        
        vc.output = presenter
        interactor.output = presenter
        
        router.presenter = presenter
        router.viewController = vc
        
        // Dependences on the services
        interactor.urlStringBuilder = URLStringBuilder()
        interactor.serverAPI = ServerManager()
        
        return presenter
    }
    
    private class func initializeViewController() -> PhotoScreenViewController {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewControllerWithIdentifier("PhotoScreenViewController") as! PhotoScreenViewController
        
        return vc
    }
}
