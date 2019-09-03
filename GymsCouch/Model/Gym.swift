//
//  Gym.swift
//  GymsCouch
//
//  Created by Abdelrahman Abu Sharkh on 9/3/19.
//  Copyright © 2019 Esraa Ragab. All rights reserved.
//

import Foundation

class Gym: Codable {
    let id : Int
    let name : String?
    let description : String?
    let facilities : String?
    let opensAt : String?
    let closesAt: String?
    let location: Location?
    let images: [String]?
    var selectedImage: String?
}

extension Gym {
    
    enum CodingKeys: String , CodingKey {
        case id
        case name
        case description
        case facilities
        case opensAt = "opens_at"
        case closesAt = "closes_at"
        case location
        case images
        case selectedImage
    }
}
