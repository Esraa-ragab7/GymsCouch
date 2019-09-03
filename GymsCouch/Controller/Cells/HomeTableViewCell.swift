//
//  HomeTableViewCell.swift
//  GymsCouch
//
//  Created by Abdelrahman Abu Sharkh on 9/3/19.
//  Copyright © 2019 Esraa Ragab. All rights reserved.
//

import UIKit
import Kingfisher

class HomeTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var gymImageView: UIImageView!
    
    // MARK: - Display Data
    func displayData(description: String, title: String, imagePath: String){
        descriptionLabel.text = description
        titleLabel.text = title
        gymImageView.kf.setImage(with: URL(string: imagePath))
    }
    
    
}
