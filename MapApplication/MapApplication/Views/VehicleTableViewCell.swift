//
//  VehicleTableViewCell.swift
//  MapApplication
//
//  Created by Ankur Bansal on 02/12/19.
//  Copyright © 2019 Ankur Bansal. All rights reserved.
//

import UIKit

class VehicleTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var modelNameLabel: UILabel!
    @IBOutlet weak var groupLabel: UILabel!
    @IBOutlet weak var licensePlateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.layer.cornerRadius = 8.0
        containerView.layer.masksToBounds = false
        containerView.layer.shadowOffset = CGSize(width: 0, height: 0)
        containerView.layer.shadowColor = AppColors.shadowColor.cgColor
        containerView.layer.shadowOpacity = 0.25
        containerView.layer.shadowRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func showData(mapModel:MapModel?){
        guard let mapModel = mapModel else {
            return
        }
        logoImageView.downloaded(from: mapModel.carImageUrl ?? "")
        modelNameLabel.text = mapModel.modelName?.capitalized
        groupLabel.text = mapModel.group?.capitalized
        licensePlateLabel.text = mapModel.licensePlate
    }

}


