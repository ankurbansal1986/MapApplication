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

    @IBOutlet weak var mapView:MKMapView!
    private(set) var viewModel = VehicleMapViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        addAnnotation()
        mapView.showAnnotations(mapView.annotations, animated: true)
    }
    
    
    

   

}

extension VehicleMapViewController : MKMapViewDelegate{
   
    func addAnnotation(){
        mapView?.addAnnotation(viewModel.vehicleAnnotation)

    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
       
        guard let annotation = annotation as? VehicleAnnotation else { return nil }
       
        let identifier = "marker"
        var view: MKMarkerAnnotationView
      
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            // 5
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        view.image = UIImage()
        return view
    }
}
    

