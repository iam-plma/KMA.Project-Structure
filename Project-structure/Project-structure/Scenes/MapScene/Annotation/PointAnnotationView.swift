//
//  PointAnnotationView.swift
//  Project-structure
//
//  Created by Elina Semenko on 02.03.2023.
//

import Foundation
import MapKit

class PointAnnotationView: MKAnnotationView {
    override var annotation: MKAnnotation? {
        didSet {
            clusteringIdentifier = "Point"
            image = UIImage(named: "PointAnnotation")
        }
    }
}

class ClusterAnnotationView: MKAnnotationView {
    override var annotation: MKAnnotation? {
        didSet {
            displayPriority = .defaultHigh
            collisionMode = .circle
            image = UIImage(named: "ClusterAnnotation")
        }
    }
}
