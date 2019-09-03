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
    static func getGyms(queries: [Queries], completion:@escaping (Result<HomeResponseModal,Error>)->Void) {
        AF.request(APIRouter.getGyms(queries: queries)).responseDecodable { (response: DataResponse<HomeResponseModal>) in
            completion(response.result)
        }
    }
    
}
