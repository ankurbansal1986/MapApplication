//
//  Navigation.swift
//  MapApplication
//
//  Created by Ankur Bansal on 02/12/19.
//  Copyright © 2019 Ankur Bansal. All rights reserved.
//

import Foundation
import UIKit

class AppNavigationManager {
    
    static let shared = AppNavigationManager()
    
    private init() {}
    
    var mainNavigationController: UINavigationController? {
        return AppDelegate.shared.window?.rootViewController as? UINavigationController
    }
}

extension AppNavigationManager {
    
    func showVehicleMapViewController(vehicle:MapModel){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vehicleMapViewController:VehicleMapViewController = storyboard.instantiateViewController(withIdentifier: "VehicleMapViewController") as! VehicleMapViewController
        vehicleMapViewController.viewModel.vehicle = vehicle
        self.mainNavigationController?.pushViewController(vehicleMapViewController, animated: true)
        
    }
    
    
}


extension AppNavigationManager {
    func startLoading() {
        PKLoader.shared.startAnimating()
    }
    
    func stopLoading() {
        PKLoader.shared.stopAnimating()
    }
}




