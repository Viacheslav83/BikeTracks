//
//  TrackModel.swift
//  BikeTracks
//
//  Created by Viacheslav Markov on 23.10.2023.
//

import Foundation
import CoreLocation

struct TrackModel: Identifiable, Hashable, Codable {
    let id: String
    let emptySlots: Int?
    let extra: ExtraModel?
    let freeBikes: Int?
    let latitude: Float?
    let longitude: Float?
    let name: String?
    let timestamp: String?
    
    var distanceInMeters: Int {
        let currentLocation = CLLocation(latitude: MockLocation.latitude, longitude: MockLocation.longitude)
        let trackLocation = CLLocation(latitude: Double(self.latitude ?? 0.0), longitude: Double(longitude ?? 0.0))
        return Int(trackLocation.distance(from: currentLocation))
    }

    enum CodingKeys: String, CodingKey {
        case emptySlots = "empty_slots"
        case freeBikes = "free_bikes"
        case id
        case extra
        case latitude
        case longitude
        case name
        case timestamp
    }
}
