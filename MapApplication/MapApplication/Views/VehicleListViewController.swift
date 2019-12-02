//
//  VehicleListViewController.swift
//  MapApplication
//
//  Created by Ankur Bansal on 02/12/19.
//  Copyright © 2019 Ankur Bansal. All rights reserved.
//

import UIKit

class VehicleListViewController: UIViewController {

    @IBOutlet weak var vehicleTableView: UITableView!  {
        didSet {
    vehicleTableView.estimatedRowHeight = UITableView.automaticDimension
    vehicleTableView.rowHeight = UITableView.automaticDimension
    vehicleTableView.register(UINib(nibName: VehicleTableViewCell.reusableIdentifier, bundle: nil), forCellReuseIdentifier: VehicleTableViewCell.reusableIdentifier)
       }
    }
    
     private(set) var viewModel = VehicleListViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.vehicleData()
        

        // Do any additional setup after loading the view.
    }
    
    
}
    
    //MARK:- Extension for table view data source and delegate methods
    //MARK:-
    extension VehicleListViewController: UITableViewDelegate, UITableViewDataSource  {
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return viewModel.numberOfSection
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return ((viewModel.vehicles) != nil) ? viewModel.vehicles!.count : 0
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell:VehicleTableViewCell = tableView.dequeueReusableCell(withIdentifier: VehicleTableViewCell.reusableIdentifier, for: indexPath) as! VehicleTableViewCell
            
            cell.showData(mapModel: viewModel.vehicles![indexPath.row])
            
           
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let vehicle:MapModel = viewModel.vehicles![indexPath.row]
            AppNavigationManager.shared.showVehicleMapViewController(vehicle: vehicle)
        }
    }
    
    //MARK:- ViewModel delegate methods
    //MARK:-
extension VehicleListViewController: VehicleListViewModelDelegate {
    func vehicleDataSuccess() {
        vehicleTableView.reloadData()
    }
    
    func vehicleDataFail() {
        
    }
    
       
    }

    

   


