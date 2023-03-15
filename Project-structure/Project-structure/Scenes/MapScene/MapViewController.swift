//
//  MapViewController.swift
//  Project-structure
//
//  Created by Elina Semenko on 01.03.2023.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    private let mapView = MKMapView()
    private var viewModel: MapVM = MapViewModel()
    private var isShowingAlert = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        setupMap()
        addGestureRecognizer()
    }
    
    private func setupViewModel() {
        viewModel.delegate = self
    }
    
    private func addGestureRecognizer() {
        let pressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handlePress))
        mapView.addGestureRecognizer(pressGesture)
    }
    
    private func setupMap() {
        view.addSubview(mapView)
        mapView.frame = view.bounds
        mapView.delegate = self
        mapView.register(PointAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        mapView.register(ClusterAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier)
        
        updateAnnotations()
    }
    
    @objc
    private func handlePress(gestureReconizer: UILongPressGestureRecognizer) {
        let location = gestureReconizer.location(in: mapView)
        let coordinate = mapView.convert(location, toCoordinateFrom: mapView)
        
        if !isShowingAlert {
            isShowingAlert = true
            showInputDialog(title: "Add text",
                            actionTitle: "Add",
                            cancelTitle: "Cancel",
                            inputPlaceholder: "Your note (max 30 ch)",
                            delegate: self,
                            inputKeyboardType: .default, cancelHandler: {[weak self]  _ in
                                self?.isShowingAlert = false
                            }, actionHandler:
                                { [weak self] (input: String?) in
                                    guard let input = input, !input.isEmpty else {
                                        self?.isShowingAlert = false
                                        return
                                    }
                                    // add to vm
                                    self?.mapView.addAnnotation(PointAnnotation(coordinate: coordinate, title: input))
                                    self?.isShowingAlert = false
                                })
        }
    }
    
    private func updateAnnotations() {
        viewModel.points.forEach({ point in
            mapView.addAnnotation(PointAnnotation(lat: point.lat, lon: point.lon, val: point.val))
        })
    }
}

extension MapViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 30
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)
        
        return newString.count <= maxLength
    }
}

extension MapViewController: MKMapViewDelegate {
    
}

extension MapViewController: MapVMDelegate {
    func didFetchAnnotations() {
        mapView.removeAnnotations(mapView.annotations)
        updateAnnotations()
    }
}
