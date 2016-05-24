//
//  PhotoScreenPresenter.swift
//  VKPhotoViewer
//
//  Created by Starikov Yevgeny on 23/05/2016.
//  Copyright © 2016 StarikovEvgen. All rights reserved.
//

import UIKit

class PhotoScreenPresenter:  PhotoScreenModuleInput, PhotoScreenViewOutput, PhotoScreenInteractorOutput
{
    var view: PhotoScreenViewInput!
    var interactor: PhotoScreenInteractorInput!
    var router: PhotoScreenRouterInput!
    
    
    //MARK:  PhotoScreenModuleInput
    
    func controller() -> UIViewController? {
        
        return router.controller()
    }
    
    func downloadWithPhoto(photo: PhotosDomainModel) {
        
        interactor.loadPhoto(photo)
    }
    
    //MARK:  PhotoScreenInteractorOutput
    
    func photoDidLoad(photo: UIImage) {
        view.updateWithPhoto(withPhoto: photo)
    }
    
    func photoIsEmpty() {
        view.updateWithoutData()
    }
    
    //MARK:  PhotoScreenViewOutput
    
    func photoDidSelect(photo: PhotosDomainModel) {
        
    }
    
    func backButtonDidSelect() {
        
        router.dismiss()
    }
    
}
