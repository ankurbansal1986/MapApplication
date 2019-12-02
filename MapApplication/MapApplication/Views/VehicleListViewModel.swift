//
//  VehicleListViewModel.swift
//  MapApplication
//
//  Created by Ankur Bansal on 02/12/19.
//  Copyright © 2019 Ankur Bansal. All rights reserved.
//

import Foundation
import UIKit
protocol VehicleListViewModelDelegate: class {
    func vehicleDataSuccess()
    func vehicleDataFail()
}
class VehicleListViewModel{
    var vehicles: [MapModel]?
     weak var delegate: VehicleListViewModelDelegate? = nil
    var numberOfSection: Int {
        return 1
    }
    
    //MARK:- Fetch vehicle list
  
    func vehicleData() {
        AppNavigationManager.shared.startLoading()
       _ = Service().makeHTTPRequest(path: scVehicle, httpRequestMethod: "GET", extraHeaders: nil, body: nil, success: {[weak self] (responseData:Data?) in
        
        AppNavigationManager.shared.stopLoading()
        if(responseData != nil){
            do {
                let vehicleList:[MapModel]? = try JSONDecoder().decode([MapModel].self, from: responseData!)
                if(vehicleList != nil ){
                    self?.vehicles = vehicleList
                    self?.delegate?.vehicleDataSuccess()
                    return
                }
                self?.delegate?.vehicleDataFail()
            }
            catch{
                self?.delegate?.vehicleDataFail()
            }
        }
            
        }) { [weak self](error:Error?) in
            self?.delegate?.vehicleDataFail()
        }
        
    }
    
}

