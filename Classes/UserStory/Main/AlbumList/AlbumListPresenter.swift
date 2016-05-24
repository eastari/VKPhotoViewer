//
//  AlbumListPresenter.swift
//  VKPhotoViewer
//
//  Created by Starikov Yevgeny on 23/05/2016.
//  Copyright © 2016 StarikovEvgen. All rights reserved.
//

import UIKit

class AlbumListPresenter:  AlbumListModuleInput, AlbumListViewOutput, AlbumListInteractorOutput
{
    var view: AlbumListViewInput!
    var interactor: AlbumListInteractorInput!
    var router: AlbumListRouterInput!
    var photosListScreen : PhotosListModuleInput!
    
    //MARK:  AlbumListModuleInput
    
    func controller() -> UIViewController? {
        
        return router.controller()
    }
    
    func downloadWithUser(user: User) {
        
        interactor.loadAlbums(user)
    }
    
    //MARK:  AlbumListInteractorOutput
    
    func modelDidLoad(model: [AlbumsDomainModel]) {
        view.update(withData: model)
    }
    
    func modelIsEmpty() {
        view.updateWithoutData()
    }
    
    //MARK:   AlbumListViewOutput
    
    func albumDidSelect(album: [PhotosDomainModel]) {
        
        router.presentPhotosList(album)
    }
    
}
