//
//  TrackResponseModel.swift
//  BikeTracks
//
//  Created by Viacheslav Markov on 23.10.2023.
//

import Foundation

struct TrackResponseModel: Identifiable, Codable {
    let id: String
    let company: [String]?
    let name: String?
    let location: LocationModel?
    let stations: [TrackModel]?
}
