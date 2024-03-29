//
//  VehicleAnnotation.swift
//  MapApplication
//
//  Created by Ankur Bansal on 02/12/19.
//  Copyright © 2019 Ankur Bansal. All rights reserved.
//

import Foundation
import MapKit

class VehicleAnnotation: NSObject, MKAnnotation {
    let title:String?
    let make: String
    let color: String
    let coordinate: CLLocationCoordinate2D
    let carImageUrl:String
    
    init(name: String, make: String, color: String,carImageUrl:String, coordinate: CLLocationCoordinate2D) {
        self.title = name
        self.make  = make
        self.color = color
        self.carImageUrl = carImageUrl
        self.coordinate = coordinate
        
        super.init()
        
    }
    
    var subtitle: String? {
        return make
    }
}
