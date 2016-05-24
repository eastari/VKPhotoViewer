//
//  LoginScreenInteractor.swift
//  VKPhotoViewer
//
//  Created by Starikov Yevgeny on 23/05/2016.
//  Copyright © 2016 StarikovEvgen. All rights reserved.
//

class LoginScreenInteractor: LoginScreenInteractorInput 
{
    weak var output: LoginScreenInteractorOutput!
    
    // MARK:  LoginScreenInteractorInput
    func initializeVKSuccess(result: VKAuthorizationResult)
    {
        var user = User()
        user.accessToken = result.token.accessToken
        user.userId = result.token.userId
        output.userInitialized(user)
    }
    
    func initializeVKFailed()
    {
        // TO DO:  handling errors
    }

}

