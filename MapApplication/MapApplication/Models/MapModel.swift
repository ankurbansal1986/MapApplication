//
//  MapModel.swift
//  MapApplication
//
//  Created by Ankur Bansal on 02/12/19.
//  Copyright © 2019 Ankur Bansal. All rights reserved.
//

import Foundation
import UIKit

struct Vehicle:Codable{
   
    let name: String?
    let make: String?
    let color: String?
    let series:String?
    let fuelType: String?
    let fuelLevel:Float?
    let transmission:String?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case make
        case color
        case series
        case fuelType = "fuel_type"
        case fuelLevel = "fuel_level"
        case transmission
    }
 }

struct Location:Codable{
    
    let latitude: Double?
    let longitude: Double?
    private enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
    }
    
}



struct MapModel: Codable {
    let id: String?
    let modelIdentifier: String?
    let modelName: String?
    let group: String?
    let licensePlate: String?
    let innerCleanliness: String?
    let carImageUrl: String?
    let vehicleDetails:Vehicle?
    let location: Location?
    private enum CodingKeys: String, CodingKey {
        case id
        case modelIdentifier
        case modelName
        case group
        case licensePlate
        case innerCleanliness
        case carImageUrl
        case vehicleDetails
        case location
    }
}
