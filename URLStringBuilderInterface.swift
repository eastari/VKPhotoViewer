//
//  URLStringBuilderInterface.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 09.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import Foundation

protocol URLStringBuilderInterface {
    func urlStringBuilder(method: MethodsAPI, parameters: NSDictionary, accessToken: String?) -> String
}

