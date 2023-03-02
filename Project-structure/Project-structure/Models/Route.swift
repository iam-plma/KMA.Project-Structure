//
//  Route.swift
//  Project-structure
//
//  Created by Elina Semenko on 02.03.2023.
//

import Foundation

struct Routes: Codable {
    let routes: [Route]
}

struct Route: Codable {
    let name: String
    let length: Double
}
