//
//  VehicleMapViewModel.swift
//  MapApplication
//
//  Created by Ankur Bansal on 02/12/19.
//  Copyright © 2019 Ankur Bansal. All rights reserved.
//

import Foundation
import MapKit
protocol VehicleMapViewModelDelegate: class {
    func vehicleDataSuccess()
    func vehicleDataFail()
}
class VehicleMapViewModel{
    var vehicle: MapModel?
    
    var vehicleAnnotation:VehicleAnnotation{
        let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: (vehicle?.location?.latitude) ??  0.0   , longitude: (vehicle?.location?.longitude) ?? 0.0)
        return VehicleAnnotation(name: (vehicle?.vehicleDetails?.name) ?? "", make: (vehicle?.vehicleDetails?.make) ?? "", color: (vehicle?.vehicleDetails?.color) ?? "", coordinate: coordinate)
    }
    weak var delegate: VehicleMapViewModelDelegate? = nil
    
    func vehicleData(){
        
    }
}

