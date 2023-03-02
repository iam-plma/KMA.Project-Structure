//
//  PointAnnotation.swift
//  Project-structure
//
//  Created by Elina Semenko on 02.03.2023.
//

import Foundation
import MapKit

class PointAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    
    init(lat: Double, lon: Double, val: String) {
        self.coordinate = CLLocationCoordinate2DMake(lat, lon)
        self.title = val
    }
    
    init(coordinate: CLLocationCoordinate2D, title: String) {
        self.coordinate = coordinate
        self.title = title
    }
}

