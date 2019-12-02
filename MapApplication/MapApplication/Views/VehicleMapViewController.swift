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
        var view: MKAnnotationView
      
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            // 5
            view = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
           
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
        }
        
        if let cachedImage = AppDelegate.imageCache.object(forKey: annotation.carImageUrl as NSString) {
            // Resize image
            let size = CGSize(width: cachedImage.size.width/2, height: cachedImage.size.height/2)
            UIGraphicsBeginImageContext(size)
            cachedImage.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
            let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
            view.image = resizedImage
           
            
        }
        
        return view
    }
}
    

