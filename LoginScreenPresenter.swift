//
//  LoginScreenPresenter.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 11.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import UIKit

class LoginScreenPresenter: PresenterOfModules, LoginScreenModuleInput, LoginScreenViewOutput, LoginScreenInteractorOutput
{
    var view: LoginScreenViewInput!
    var interactor: LoginScreenInteractorInput!
    var router: LoginScreenRouterInput!
    var albumListScreen : AlbumListModuleInput!
    
    weak var output: LoginScreenModuleOutput?
    
    //MARK: PresenterOfModules - mediator pattern
    
    override func receive(message: Any) {
        print("Received LoginScreenPresenter: \(message)")
    }
    
    //MARK:  LoginScreenModuleInput
    
    func present(fromWindow window: UIWindow) {
        router.present(fromWindow: window)
    }

    //MARK:  LoginScreenViewOutput
    
    func initializeVKSuccess(result: VKAuthorizationResult) {
        interactor.initializeVKSuccess(result)
    }
 
    func initializeVKFailed() {
        interactor.initializeVKFailed()
    }
    
    //MARK:  LoginScreenModuleOutput
    
    func userInitialized(user: User) {
        
        router.presentAlbumList()
        self.send(user)

    }
    
}
