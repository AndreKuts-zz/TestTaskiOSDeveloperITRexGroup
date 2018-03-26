//
//  PhotoObject.swift
//  TestTaskiOSDeveloperITRexGroup
//
//  Created by 1 on 22.03.2018.
//  Copyright © 2018 ANDRE.CORP. All rights reserved.
//


import RealmSwift
import CoreLocation


class Photo: Object {
    
    @objc dynamic var name = ""
    @objc dynamic var lat = 0.0
    @objc dynamic var long = 0.0
    @objc dynamic var imageData = NSData()
    
    convenience init(photo name: String, lat: CLLocationDegrees, long: CLLocationDegrees, imageData: NSData) {
        self.init()
        
        self.name = name
        self.lat = Double(lat)
        self.long = Double(long)
        self.imageData = imageData
    }
    
}
