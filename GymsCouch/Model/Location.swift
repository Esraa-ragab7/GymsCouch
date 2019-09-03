//
//  Location.swift
//  GymsCouch
//
//  Created by Abdelrahman Abu Sharkh on 9/3/19.
//  Copyright © 2019 Esraa Ragab. All rights reserved.
//

import Foundation

class Location: Codable {
    let lat : Double
    let lng : Double
    let address : String?
}

extension Location {
    
    enum CodingKeys: String , CodingKey {
        case lat
        case lng
        case address
    }
}
