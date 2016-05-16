//
//  PresenterOfModules.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 15.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import Foundation

// mediator pattern

class PresenterOfModules {
    
    let mediator: MediatorInterface
    
    init(mediator: MediatorInterface) {

        self.mediator = mediator
    }
    
    func send(message: Any) {
        mediator.send(message, presenters: self)
    }
    
    func receive(message: Any) {
        assert(false, "Method should be overriden")
    }
}
