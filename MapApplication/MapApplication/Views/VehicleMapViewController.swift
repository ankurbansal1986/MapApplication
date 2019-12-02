//
//  VehicleMapViewController.swift
//  MapApplication
//
//  Created by Ankur Bansal on 02/12/19.
//  Copyright © 2019 Ankur Bansal. All rights reserved.
//

import UIKit
import MapKit
class VehicleMapViewController: UIViewController {

    @IBOutlet weak var mapView:MKMapView?
    private(set) var viewModel = VehicleMapViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
      
      
        viewModel.vehicleData()
        
        
        // Do any additional setup after loading the view.
    }
    
    
    

   

}

extension VehicleMapViewController : MKMapViewDelegate{
   
    func addAnnotation(){
//        let annotation:MKAnnotation = MKAnnotation()
//        annotation.title =
//        london.title = "London"
//        london.coordinate = CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275)
//        yourMapView.addAnnotation(london)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }
        
        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
        } else {
            annotationView!.annotation = annotation
        }
        
        return annotationView
    }
    
}
