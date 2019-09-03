//
//  APIClient.swift
//  GymsCouch
//
//  Created by Esraa Ragab on 9/2/19.
//  Copyright © 2019 Esraa Ragab. All rights reserved.
//

import Alamofire
import UIKit

class APIClient {
    
    // MARK: - getGyms
    static func getGyms(completion:@escaping (Result<[Home],Error>)->Void) {
        AF.request(APIRouter.getHome).responseDecodable { (response: DataResponse<[Home]>) in
            completion(response.result)
        }
    }
    
}
