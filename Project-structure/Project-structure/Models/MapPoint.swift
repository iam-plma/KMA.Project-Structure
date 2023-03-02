//
//  MapPoint.swift
//  Project-structure
//
//  Created by Elina Semenko on 02.03.2023.
//

import Foundation

struct MapPoints: Codable {
    let points: [MapPoint]
}

struct MapPoint: Codable {
    let lat: Double
    let lon: Double
    let val: String
}
