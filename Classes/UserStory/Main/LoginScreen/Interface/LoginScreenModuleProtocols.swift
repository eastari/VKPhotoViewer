//
//  LoginScreen Module Protocols
//  VKPhotoViewer
//
//  Created by Starikov Yevgeny on 23/05/2016.
//  Copyright © 2016 StarikovEvgen. All rights reserved.
//

import UIKit
import Foundation

//MARK: - MODULE
//MARK: Input
protocol LoginScreenModuleInput : class
{
	func present(fromWindow window: UIWindow)
}

//MARK: Output
protocol LoginScreenModuleOutput : class
{
	func userInitialized(user: User)
}

//MARK: - ROUTER input
protocol LoginScreenRouterInput : ViperRouterInput
{
    func present(fromWindow window: UIWindow)
    func presentAlbumList(user: User)
}

//MARK: - INTERACTOR
//MARK: Input
protocol LoginScreenInteractorInput : class
{
    func initializeVKSuccess(result: VKAuthorizationResult)
    func initializeVKFailed()
}

//MARK: Output
protocol LoginScreenInteractorOutput : class 
{
    func userInitialized(user: User)
}

//MARK: - VIEW
//MARK: Input
protocol LoginScreenViewInput : ViperViewInput 
{

}

//MARK: Output
protocol LoginScreenViewOutput : class
{
    func initializeVKSuccess(result: VKAuthorizationResult)
    func initializeVKFailed()
}







