//
//  GymDetailsViewModel.swift
//  GymsCouch
//
//  Created by Esraa Mohamed Ragab on 9/3/19.
//  Copyright © 2019 Esraa Ragab. All rights reserved.
//

import UIKit

class GymDetailsViewModel {
    
    // MARK: - Properies
    let gym: Gym
    let image: String
    let name: String
    let description: String
    let location: String
    let time: String
    let facilities: String
    
    // MARK: - Object Life Cycle
    init(gym: Gym) {
        self.gym = gym
        self.name = gym.name!
        self.image = gym.selectedImage!
        self.description = gym.description!
        self.location = gym.location?.address ?? ""
        self.time = "from \(gym.opensAt ?? "") to \(gym.closesAt ?? "")"
        self.facilities = gym.facilities!
    }
    
}
