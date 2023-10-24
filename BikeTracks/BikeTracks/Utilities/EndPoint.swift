//
//  EndPoint.swift
//  BikeTracks
//
//  Created by Viacheslav Markov on 23.10.2023.
//

import Foundation

protocol EndPointProtocol {
    var url: URL? { get }
}

extension EndPointProtocol {
    var baseURL: String {
        return "https://api.citybik.es/v2/"
    }
}

enum EndPoint: String, EndPointProtocol {
    
    case tracks = "networks/wienmobil-rad"
    
    var url: URL? {
        return URL(string: baseURL + self.rawValue)
    }
    
    var urlString: String {
        return baseURL + self.rawValue
    }
}
