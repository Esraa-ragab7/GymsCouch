//
//  HomeResponseModal.swift
//  GymsCouch
//
//  Created by Esraa Ragab on 9/3/19.
//  Copyright © 2019 Esraa Ragab. All rights reserved.
//

import Foundation

class HomeResponseModal: Codable {
    let code: Int
    let status: String?
    let data: Data?
}

extension HomeResponseModal {
    
    enum CodingKeys: String , CodingKey {
        case code
        case status
        case data
    }
}
