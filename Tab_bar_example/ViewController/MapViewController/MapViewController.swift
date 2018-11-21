//
//  MapViewController.swift
//  Tab_bar_example
//
//  Created by Biolizard on 21/11/2018.
//  Copyright © 2018 Biolizard. All rights reserved.
//

import UIKit
import MapKit
class MapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    internal var locationToShow: CLLocation?
    
    convenience init(lat: Double! , lng: Double!){
        self.init()
        self.locationToShow = CLLocation(latitude: lat, longitude: lng)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       let annotation = MKPointAnnotation()
        annotation.coordinate = (locationToShow?.coordinate)!
        mapView.addAnnotation(annotation)
        
        let region = MKCoordinateRegion(center: ((locationToShow?.coordinate)!), latitudinalMeters: 390000, longitudinalMeters: 390000)
            mapView.setRegion(region, animated: false)
        
        
        


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
    
    @IBAction func segmentedControlTypeDidChange(){
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .satellite
        case 2:
            mapView.mapType = .hybrid
        default:
            mapView.mapType = .standard
        }
    }
}
