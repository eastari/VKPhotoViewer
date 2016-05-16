//
//  AlbumListInteractor.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 13.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import Foundation

class AlbumListInteractor: AlbumListInteractorInput {
    
    weak var output: AlbumListInteractorOutput!
    
    var serverAPI: ServerManagerInterface!
    var httpString: HttpStringServiceInterface!
    var parseDataAPI: ParseDataServiceInterface!
    
    
    func loadAlbums(user: User)  {
        
        // TO DO:  user_id, accessToken
        
        let parametersOfRequest: NSDictionary =
        [
            "user_id"      : user.userId!,
            "access_token" : user.accessToken!
        ]
        
        let urlString = self.httpString.httpStringConstructor(.Albums, parameters: parametersOfRequest, accessToken: nil)
        
        ServerManager.sharedServerManager.getFromServer(urlString) { result in
            switch result {
            case .Success(let data):
                // handle successful data response here
                do{
                    let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
                    self.getModelsFromJSON(json)
                    
                }catch{
                    print("Could not serialize")
                    self.output.modelIsEmpty()
                }
            case .Error(let msg, let code):
                // handle error here
                print("Error [\(code)]: \(msg)")
                self.output.modelIsEmpty()
            }
        }
    }
    
    func getModelsFromJSON (json: AnyObject) {
 
        self.parseDataAPI.getModelsFromJSON(json, userId: "301302780", method: .Albums, accessToken: nil, completion: { (model) -> Void in
            
            if model.count > 0 {
                self.output.modelDidLoad(model)
            } else {
                self.output.modelIsEmpty()
            }

        })
    }
}
