//
//  PhotoScreenInteractor.swift
//  VKPhotoViewer
//
//  Created by Starikov Yevgeny on 23/05/2016.
//  Copyright © 2016 StarikovEvgen. All rights reserved.
//

import Foundation

class PhotoScreenInteractor: PhotoScreenInteractorInput {
    
    weak var output: PhotoScreenInteractorOutput!
    
    var serverAPI: ServerManagerInterface!
    var urlStringBuilder: URLStringBuilderInterface!
    
    func loadPhoto(photo: PhotosDomainModel)  {
        
        let urlString = String(photo.imageURLsize807!)
        
        ServerManager.sharedServerManager.getFromServer(urlString) { result in
            switch result {
            case .Success(let data):
                // handle successful data response here
                if let image = UIImage(data: data) {
                    self.output.photoDidLoad(image)
                } else {
                    self.output.photoIsEmpty()
                }
                
            case .Error(let msg, let code):
                // handle error here
                print("Error [\(code)]: \(msg)")
                self.output.photoIsEmpty()
            }
        }
    }
}