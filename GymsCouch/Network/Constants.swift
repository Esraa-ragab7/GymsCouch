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
        static let ip = "http://35.237.146.248"
        static let baseURL = "http://35.237.146.248/api"
        static let apiKey = "53c3a341d92acf59d9b35c35ddbc5fc4bf587dd7e643a65c3766dada6a7df7c1"
    }
    
    struct APIParameterKey {
        
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case apiKey = "X-api-key"
    case country = "Country"
    case language = "Accept-Language"
}

enum ContentType: String {
    case json = "application/json"
    case language = "en"
    case country = "AE"
    case apiKey = "53c3a341d92acf59d9b35c35ddbc5fc4bf587dd7e643a65c3766dada6a7df7c1"
}
