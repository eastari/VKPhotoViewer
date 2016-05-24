//
//  AlbumList Module Protocols
//  VKPhotoViewer
//
//  Created by Starikov Yevgeny on 23/05/2016.
//  Copyright © 2016 StarikovEvgen. All rights reserved.
//
//
// master ++


import UIKit
import Foundation

//MARK: - MODULE
//MARK: Input
protocol AlbumListModuleInput : class
{
    func controller() -> UIViewController?
    func downloadWithUser(user: User)
}

//MARK: Output
protocol AlbumListModuleOutput : class
{
		
}

//MARK: - ROUTER input
protocol AlbumListRouterInput : ViperRouterInput
{
    func controller() -> UIViewController?
    func dismiss()
    func presentPhotosList(album: [PhotosDomainModel])
}

//MARK: - INTERACTOR
//MARK: Input
protocol AlbumListInteractorInput : class
{
    func loadAlbums(user: User)
}

//MARK: Output
protocol AlbumListInteractorOutput : class 
{
    func modelDidLoad(model: [AlbumsDomainModel])
    func modelIsEmpty()
}

//MARK: - VIEW
//MARK: Input
protocol AlbumListViewInput : ViperViewInput 
{
    func update(withData data:[AlbumsDomainModel])
    func updateWithoutData()
}

//MARK: Output
protocol AlbumListViewOutput : class
{
    func albumDidSelect(album: [PhotosDomainModel])
}

