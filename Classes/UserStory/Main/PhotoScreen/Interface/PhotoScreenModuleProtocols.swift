//
//  PhotoScreen Module Protocols
//  VKPhotoViewer
//
//  Created by Starikov Yevgeny on 23/05/2016.
//  Copyright © 2016 StarikovEvgen. All rights reserved.
//

import UIKit
import Foundation

//MARK: - MODULE
//MARK: Input
protocol PhotoScreenModuleInput : class
{
    func controller() -> UIViewController?
    func downloadWithPhoto(photo: PhotosDomainModel)
}

//MARK: Output
protocol PhotoScreenModuleOutput : class
{
    func photoDidSelect(photo: PhotosDomainModel)
    func backToAlbumScreenDidSelect()
}

//MARK: - ROUTER input
protocol PhotoScreenRouterInput : ViperRouterInput
{
    func controller() -> UIViewController?
    func dismiss()
}

//MARK: - INTERACTOR
//MARK: Input
protocol PhotoScreenInteractorInput : class
{
    func loadPhoto(photo: PhotosDomainModel)
}

//MARK: Output
protocol PhotoScreenInteractorOutput : class 
{
    func photoDidLoad(photo: UIImage)
    func photoIsEmpty()
}

//MARK: - VIEW
//MARK: Input
protocol PhotoScreenViewInput : ViperViewInput 
{
    func updateWithPhoto(withPhoto photo: UIImage)
    func updateWithoutData()
}

//MARK: Output
protocol PhotoScreenViewOutput : class
{
    func photoDidSelect(photo: PhotosDomainModel)
    func backButtonDidSelect()
}
