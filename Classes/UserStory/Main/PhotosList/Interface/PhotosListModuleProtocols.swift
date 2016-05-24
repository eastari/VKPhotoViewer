//
//  PhotosList Module Protocols
//  VKPhotoViewer
//
//  Created by Starikov Yevgeny on 23/05/2016.
//  Copyright © 2016 StarikovEvgen. All rights reserved.
//

import UIKit
import Foundation

//MARK: - MODULE
//MARK: Input
protocol PhotosListModuleInput : class
{
    func controller() -> UIViewController?
    func downloadWithAlbum(album: [PhotosDomainModel])
}

//MARK: Output
protocol PhotosListModuleOutput : class
{
    func photoDidSelect(photo: PhotosDomainModel)
    func backToAlbumScreenDidSelect()
}

//MARK: - ROUTER input
protocol PhotosListRouterInput : ViperRouterInput
{
    func controller() -> UIViewController?
    func dismiss()
    func presentPhotoScreen(photo: PhotosDomainModel)
}

//MARK: - INTERACTOR
//MARK: Input
protocol PhotosListInteractorInput : class
{

}

//MARK: Output
protocol PhotosListInteractorOutput : class 
{

}

//MARK: - VIEW
//MARK: Input
protocol PhotosListViewInput : ViperViewInput 
{
    func update(withData data:[PhotosDomainModel])
    func updateWithoutData()
}

//MARK: Output
protocol PhotosListViewOutput : class
{
    func photoDidSelect(photo: PhotosDomainModel)
    func backButtonDidSelect()
}

