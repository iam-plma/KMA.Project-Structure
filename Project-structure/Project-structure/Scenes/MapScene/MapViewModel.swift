//
//  MapViewModel.swift
//  Project-structure
//
//  Created by Elina Semenko on 02.03.2023.
//

import Foundation

protocol MapVM {
    var points: [MapPoint] { get }
}

class MapViewModel: MapVM {
    var points: [MapPoint] = []
    
    init() {
        fetchPoints()
    }
}

extension MapViewModel {
    // TODO:- Update to Firebase methods
    private func fetchPoints() {
        guard let url = Bundle.main.url(forResource: "Coordinates", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let jsonData = try? JSONDecoder().decode(MapPoints.self, from: data)
        else { return }
        points = jsonData.points
    }
    
    private func addPoint() {
        
    }
}
