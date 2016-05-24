//
//  LoginScreenPresenter.swift
//  VKPhotoViewer
//
//  Created by Starikov Yevgeny on 23/05/2016.
//  Copyright © 2016 StarikovEvgen. All rights reserved.
//

import UIKit

class LoginScreenPresenter : LoginScreenModuleInput, LoginScreenViewOutput, LoginScreenInteractorOutput
{
    var view: LoginScreenViewInput!
    var interactor: LoginScreenInteractorInput!
    var router: LoginScreenRouterInput!
    var albumListScreen : AlbumListModuleInput!
	
	weak var output: LoginScreenModuleOutput?
	
	// MARK: - Module Input
		
    func present(fromWindow window: UIWindow)
    {
        router.present(fromWindow: window)
    }
		
	// MARK: - Interactor Output
    
    func userInitialized(user: User)
    {
        router.presentAlbumList(user)
    }
    
	// MARK: - View Output
    
    func initializeVKSuccess(result: VKAuthorizationResult)
    {
        interactor.initializeVKSuccess(result)
    }
    
    func initializeVKFailed()
    {
        interactor.initializeVKFailed()
    }

}


    

