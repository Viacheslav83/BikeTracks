//
//  ApiRequest.swift
//  BikeTracks
//
//  Created by Viacheslav Markov on 23.10.2023.
//

import Foundation

enum ApiRequest {
    case trackAPI
    
    var url: String {
        switch self {
        case .trackAPI:
            return EndPoint.tracks.urlString
        }
    }
    
    var httpMethod: String {
        switch self {
        case .trackAPI:
            return "GET"
        }
    }
    
    var bodyParams: Data? {
        switch self {
        case .trackAPI:
            return nil
        }
    }
    
    var headerFields: [String: String]? {
        switch self {
        case .trackAPI:
            return nil
        }
    }
    
    var request: URLRequest? {
        guard let url = URL(string: self.url) else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        request.allHTTPHeaderFields = headerFields
        
        switch self {
        case .trackAPI:
            break
        }
        return request
    }
}
