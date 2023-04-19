//
//  PastWalk.swift
//  Project-structure
//
//  Created by Elina Semenko on 16.03.2023.
//

import Foundation

struct PastWalks: Codable {
    let data: [Walk]
}

struct Walk: Codable {
    let date: String
    let length: Double
    let time: Double
}
