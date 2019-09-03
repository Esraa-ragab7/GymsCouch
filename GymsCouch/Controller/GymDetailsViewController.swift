//
//  GymDetailsViewController.swift
//  GymsCouch
//
//  Created by Esraa Mohamed Ragab on 9/3/19.
//  Copyright © 2019 Esraa Ragab. All rights reserved.
//

import UIKit
import Kingfisher

class GymDetailsViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var gymImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var locationNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var facilitiesLabel: UILabel!
    
    var gymDetailsViewModel: GymDetailsViewModel!
    
    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateScreen()
    }
    
    
    // MARK: - Back Action
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

// MARK: - Private Functions
extension GymDetailsViewController {
    
    func updateScreen() {
        gymImage.kf.setImage(with: URL(string: gymDetailsViewModel.image))
        nameLabel.text = gymDetailsViewModel.name
        descriptionLabel.text = gymDetailsViewModel.description
        locationNameLabel.text = gymDetailsViewModel.location
        timeLabel.text = gymDetailsViewModel.time
        facilitiesLabel.text = gymDetailsViewModel.facilities
    }
    
}
