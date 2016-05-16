//
//  PhotosListPresenter.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 14.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import UIKit

class PhotosListPresenter: PresenterOfModules, PhotosListModuleInput, PhotosListViewOutput, PhotosListInteractorOutput
{
    var view: PhotosListViewInput!
    var interactor: PhotosListInteractorInput!
    var router: PhotosListRouterInput!
    var photoScreen : PhotoScreenModuleInput!

    //MARK: PresenterOfModules - mediator pattern
    
    override func receive(message: Any) {
        
        if let album = message as? [PhotosDomainModel] {
            view.update(withData: album)
        } else {
            view.updateWithoutData()
        }
    }
    
    //MARK:  PhotosListModuleInput
    
    func controller() -> UIViewController? {
        
        return router.controller()
    }
    
    //MARK:  PhotosListViewOutput
    
    func photoDidSelect(photo: PhotosDomainModel) {
        
        router.presentPhotoScreen()
        self.send(photo)
    }
    
    func backButtonDidSelect() {
        
        router.dismiss()
    }
    
}

