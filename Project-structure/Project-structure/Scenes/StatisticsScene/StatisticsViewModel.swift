//
//  StatisticsViewModel.swift
//  Project-structure
//
//  Created by Elina Semenko on 16.03.2023.
//

import Foundation

protocol StatisticsDelegate: AnyObject {
    func didUpdate()
}

protocol StatisticsVM {
    var delegate: StatisticsDelegate? { get set }
    var walks: [Walk] { get }
}

class StatisticsViewModel: StatisticsVM {
    weak var delegate: StatisticsDelegate?
    
    var walks: [Walk] = [] {
        didSet {
            delegate?.didUpdate()
        }
    }
    
    init() {
        fetchPastData()
    }
}

extension StatisticsViewModel {
    // TODO:- Update to Core Data methods
    private func fetchPastData() {
        guard let url = Bundle.main.url(forResource: "PastData", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let jsonData = try? JSONDecoder().decode(PastWalks.self, from: data)
        else { return }
        walks = jsonData.data
    }
}

