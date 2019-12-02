//
//  VehicleMapViewModel.swift
//  MapApplication
//
//  Created by Ankur Bansal on 02/12/19.
//  Copyright © 2019 Ankur Bansal. All rights reserved.
//

import Foundation
protocol VehicleMapViewModelDelegate: class {
    func vehicleDataSuccess()
    func vehicleDataFail()
}
class VehicleMapViewModel{
     var vehicle: MapModel?
    weak var delegate: VehicleMapViewModelDelegate? = nil
    
    func vehicleData(){
        
    }
}

