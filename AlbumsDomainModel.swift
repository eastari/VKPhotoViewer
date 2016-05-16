//
//  AlbumsDomainModel.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 04.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import Foundation

class AlbumsDomainModel: ImageParentDomainModel {
    var title: String?
    var thumbId = -1
    var photos:[PhotosDomainModel]?
}




