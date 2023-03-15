//
//  MapViewModel.swift
//  Project-structure
//
//  Created by Elina Semenko on 02.03.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseCore

protocol MapVM {
    var points: [MapPoint] { get }
    var delegate: MapVMDelegate? { get set }
}

protocol MapVMDelegate: AnyObject {
    func didFetchAnnotations()
}

class MapViewModel: MapVM {
    var points: [MapPoint] = []
    weak var delegate: MapVMDelegate?
    private let db = Firestore.firestore()
    
    init() {
        fetchPoints()
    }
}

extension MapViewModel {
    // TODO:- Update to Firebase methods
    private func fetchPoints() {
        db.collection("points")
            .addSnapshotListener { [weak self] documents, error in
              guard let documents = documents else {
                print("Error fetching documents: \(error!)")
                return
              }
                let data = documents.documents.map({$0.data()})
                let points = data.compactMap({try? MapPoint(dict: $0)})
                self?.points = points
                self?.delegate?.didFetchAnnotations()
              print("Current data: \(points)")
            }
    }
    
    private func addPoint() {
        
    }
}
