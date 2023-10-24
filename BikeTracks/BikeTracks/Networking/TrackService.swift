//
//  TrackService.swift
//  BikeTracks
//
//  Created by Viacheslav Markov on 23.10.2023.
//

import Foundation

protocol TrackServiceProtocol {
    func fetchData(completion: @escaping (_ result: Result<NetworkResponse, ApiError>) -> Void)
}

final class TrackService: TrackServiceProtocol {
    
    static let shared: TrackServiceProtocol = TrackService()
    
    func fetchData(
        completion: @escaping (_ result: Result<NetworkResponse, ApiError>) -> Void
    ) {
        guard
            let request = ApiRequest.trackAPI.request
        else { return }
        
        NetworkRequestManager.shared.request(request: request) { (result: Result<NetworkResponse, ApiError>) in
            completion(result)
        }
    }
}
