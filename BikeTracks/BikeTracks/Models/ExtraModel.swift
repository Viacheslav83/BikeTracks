//
//  ExtraModel.swift
//  BikeTracks
//
//  Created by Viacheslav Markov on 23.10.2023.
//

import Foundation

struct ExtraModel: Hashable, Codable {
    let bikeUids: [String]?
    let number: String?
    let slots: Int?
    let uid: String?
    
    enum CodingKeys: String, CodingKey {
        case bikeUids = "bike_uids"
        case number
        case slots
        case uid
    }
}
