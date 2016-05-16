//
//  AlbumListPresenter.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 13.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import UIKit

class AlbumListPresenter: PresenterOfModules, AlbumListModuleInput, AlbumListViewOutput, AlbumListInteractorOutput
{
    var view: AlbumListViewInput!
    var interactor: AlbumListInteractorInput!
    var router: AlbumListRouterInput!
    var photosListScreen : PhotosListModuleInput!
    
    //MARK: PresenterOfModules - mediator pattern
    
    override func receive(message: Any) {
        
        if let user = message as? User {
            interactor.loadAlbums(user)
        }
    }
    
    //MARK:  AlbumListModuleInput
    
    func controller() -> UIViewController? {
        
        return router.controller()
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
        
        router.presentPhotosList()
        self.send(album)
    }
    
}
