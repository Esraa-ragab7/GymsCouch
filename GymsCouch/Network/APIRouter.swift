//
//  APIRouter.swift
//  GymsCouch
//
//  Created by Esraa Ragab on 9/2/19.
//  Copyright © 2019 Esraa Ragab. All rights reserved.
//

import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case getGyms(queries: [Queries])
    case getGymDetail(id: String)
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .getGyms, .getGymDetail:
            return .get
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .getGyms, .getGymDetail:
            return "/gyms"
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .getGyms, .getGymDetail:
            return nil
        }
    }
    
    // MARK: - Headers
    private var queries: [Queries]? {
        switch self {
        case .getGyms(let queries):
            return queries
        case .getGymDetail:
            return nil
        }
    }
    
    // MARK: - Dynamic Parameter
    private var dynamicParam: String? {
        switch self {
        case .getGyms:
            return nil
        case .getGymDetail(let id):
            return "/\(id)"
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = Constants.ProductionServer.baseURL
        
        var components = URLComponents(string: "\(url)\(path)\(dynamicParam ?? "")")!
        
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
        urlRequest.setValue(ContentType.language.rawValue, forHTTPHeaderField: HTTPHeaderField.language.rawValue)
        urlRequest.setValue(ContentType.country.rawValue, forHTTPHeaderField: HTTPHeaderField.country.rawValue)
        urlRequest.setValue(ContentType.apiKey.rawValue, forHTTPHeaderField: HTTPHeaderField.apiKey.rawValue)
        
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
