//
//  PointOnMap.swift
//  TestTaskiOSDeveloperITRexGroup
//
//  Created by 1 on 22.03.2018.
//  Copyright © 2018 ANDRE.CORP. All rights reserved.
//

import MapKit

class PointOnMap: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init (coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }

}











