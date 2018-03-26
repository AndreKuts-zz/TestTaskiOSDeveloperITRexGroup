//
//  MapVC.swift
//  TestTaskiOSDeveloperITRexGroup
//
//  Created by 1 on 21.03.2018.
//  Copyright © 2018 ANDRE.CORP. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapVC: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    var arrImage : Photo!
    var index: Int!
    @IBOutlet weak var map: MKMapView!
    var pom: PointOnMap!
    let locationMamager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let photo = arrImage
        
        returnCoordinate(lat: (photo?.lat)!, long: (photo?.long)!, name: "\(index)")
        map.showsUserLocation = true
    }
    
    func returnCoordinate(lat: Double, long: Double, name: String)  {
        let result = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let regoin = MKCoordinateRegionMakeWithDistance(result, 1500, 1500)
        pom = PointOnMap(coordinate: result, title: name, subtitle: nil)
        map.addAnnotation(pom)
        map.setRegion(regoin, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKAnnotationView(annotation: pom, reuseIdentifier: "Photo")
//        annotationView.image = UIImage(named: "img_2")
        return annotationView
    }
    
    
    
}


