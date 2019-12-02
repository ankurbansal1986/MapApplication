//
//  Navigation.swift
//  MapApplication
//
//  Created by Ankur Bansal on 02/12/19.
//  Copyright © 2019 Ankur Bansal. All rights reserved.
//

import Foundation
import UIKit
protocol Navigation{
    
    func showVehicleMapViewController(vehicle:MapModel)
    
}

extension Navigation where Self:UIViewController{
    func showVehicleMapViewController(vehicle:MapModel){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vehicleMapViewController:VehicleMapViewController = storyboard.instantiateViewController(withIdentifier: "VehicleMapViewController") as! VehicleMapViewController
        vehicleMapViewController.viewModel.vehicle = vehicle
        self.navigationController?.pushViewController(vehicleMapViewController, animated: true)
        
    }
    
}
