//
//  LocationModel.swift
//  BikeTracks
//
//  Created by Viacheslav Markov on 23.10.2023.
//

import Foundation

struct LocationModel: Hashable, Identifiable, Codable {
    let id = UUID().uuidString
    
    let city: String?
    let country: String?
    let latitude: Double?
    let longitude: Double?
}
