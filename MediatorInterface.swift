//
//  MediatorInterface.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 15.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import Foundation

// mediator pattern

protocol MediatorInterface {
    func send(message: Any, presenters: PresenterOfModules)
}