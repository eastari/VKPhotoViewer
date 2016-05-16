//
//  Mediator.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 15.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import Foundation

//mediator pattern

class Mediator: MediatorInterface {
    private var presentersOfModules: [PresenterOfModules] = []
    
    func addPresenterOfModules(presenter: PresenterOfModules) {
        presentersOfModules.append(presenter)
    }
    
    func send(message: Any, presenters: PresenterOfModules) {
        for c in presentersOfModules {
            if c !== presenters { //compare object references
                c.receive(message)
            }
        }
    }
}