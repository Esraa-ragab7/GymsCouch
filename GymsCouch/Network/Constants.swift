//
//  Constants.swift
//  Fatorty
//
//  Created by Esraa Mohamed Ragab on 6/23/19.
//  Copyright © 2019 Esraa Mohamed Ragab. All rights reserved.
//

import Foundation

struct Constants {
    struct ProductionServer {
        static let ip = ""
        static let baseURL = ""
    }
    
    struct APIParameterKey {
        
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
