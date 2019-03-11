//
//  MapViewController.swift
//  AppartoTest
//

import UIKit
import MapKit
import FontAwesome_swift

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var bar : Bar?
    var isFromTable : Bool = false
    
    let parisLocation = CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (self.isFromTable) {
            let location = CLLocationCoordinate2D(latitude: (bar?.latitude)!, longitude: (bar?.longitude)!)
            let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
            let region = MKCoordinateRegion(center: location, span: span)
            mapView.setRegion(region, animated: true)
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            annotation.title = bar?.name
            mapView.addAnnotation(annotation)
        } else {
            let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
            let region = MKCoordinateRegion(center: self.parisLocation, span: span)
            mapView.setRegion(region, animated: true)
            let list = BarsServices.instance.bars
            for bar in list {
                let annotation = MKPointAnnotation()
                annotation.coordinate.latitude = bar.latitude!
                annotation.coordinate.longitude = bar.longitude!
                annotation.title = bar.name
                mapView.addAnnotation(annotation)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "Map"
    }
}
