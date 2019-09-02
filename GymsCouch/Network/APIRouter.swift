//
//  APIRouter.swift
//  GymsCouch
//
//  Created by Esraa Ragab on 9/2/19.
//  Copyright © 2019 Esraa Ragab. All rights reserved.
//

import Alamofire

enum APIRouter: URLRequestConvertible {
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
            
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
            
        }
    }
    
    // MARK: - Headers
    private var queries: [Queries]? {
        switch self {
            
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = Constants.ProductionServer.baseURL
        
        var components = URLComponents(string: "\(url)\(path)")!
        
        // Add Queries
        if let queries = queries {
            components.queryItems = [URLQueryItem]()
            for query in queries {
                let queryItem = URLQueryItem(name: query.key, value: query.value)
                components.queryItems!.append(queryItem)
            }
            components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        }
        
        var urlRequest = URLRequest(url: components.url!)
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
//        if let accessToken = User.shared?.token {
//            urlRequest.setValue("Bearer \(accessToken)", forHTTPHeaderField: HTTPHeaderField.authentication.rawValue)
//        }
        
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}

struct Queries {
    let key: String
    let value: String
}
