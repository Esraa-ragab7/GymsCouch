//
//  Data.swift
//  GymsCouch
//
//  Created by Abdelrahman Abu Sharkh on 9/3/19.
//  Copyright © 2019 Esraa Ragab. All rights reserved.
//

import Foundation

class Data: Codable {
    let items : [Gym]?
    let totalPages : Int?
    let totalCount : Int?
}

extension Data {
    
    enum CodingKeys: String , CodingKey {
        case items
        case totalPages = "total_pages"
        case totalCount = "total_count"
    }
}
