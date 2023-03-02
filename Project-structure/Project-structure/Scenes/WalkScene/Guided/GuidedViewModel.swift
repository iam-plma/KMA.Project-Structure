//
//  GuidedViewModel.swift
//  Project-structure
//
//  Created by Elina Semenko on 02.03.2023.
//

import Foundation

protocol GuidedDelegate: AnyObject {
    func didUpdate()
}

protocol GuidedVM {
    var delegate: GuidedDelegate? { get set }
    var routes: [Route] { get }
}

class GuidedViewModel: GuidedVM {
    weak var delegate: GuidedDelegate?
    
    var routes: [Route] = [] {
        didSet {
            delegate?.didUpdate()
        }
    }
    
    init() {
        fetchRoutes()
    }
}

extension GuidedViewModel {
    // TODO:- Update to Firebase methods
    private func fetchRoutes() {
        guard let url = Bundle.main.url(forResource: "Routes", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let jsonData = try? JSONDecoder().decode(Routes.self, from: data)
        else { return }
        routes = jsonData.routes
    }
    
    private func addPoint() {
        
    }
}

