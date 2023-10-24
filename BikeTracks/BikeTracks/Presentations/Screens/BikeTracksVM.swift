//
//  BikeTracksVM.swift
//  BikeTracks
//
//  Created by Viacheslav Markov on 23.10.2023.
//

import Foundation
import CoreLocation

protocol BikeTracksVMProtocol: AnyObject {
    var delegate: BikeTracksVMDelegating? { get set }
    func fetchTracks()
}

protocol BikeTracksVMDelegating: AnyObject {
    func didUpdatedDataSource(models: [TrackModel])
    func showError(message: String)
}

final class BikeTracksVM: BikeTracksVMProtocol {
    weak var delegate: BikeTracksVMDelegating?
    
    func fetchTracks() {
        TrackService.shared.fetchData { [weak self] (result) in
            guard
                let self = self
            else {
                self?.delegate?.showError(message: "BikeTracksVM is missing!")
                return
            }
            switch result {
            case .failure(let error):
                self.delegate?.showError(message: error.errorMessage)
            case .success(let response):
                let models = self.sortedTracks(at: response.network?.stations ?? [])
                self.delegate?.didUpdatedDataSource(models: models)
            }
        }
    }
    
    private func sortedTracks(at models: [TrackModel]) -> [TrackModel] {
        var newModels = models.sorted(by: { ($0.name ?? "") < ($1.name ?? "") })
        let distances = newModels.map({ $0.distanceInMeters })
        let minValue = distances.min()
        
        let firstItemIndex = newModels.firstIndex(where: { $0.distanceInMeters == minValue }) ?? 0
        
        let firstItem = newModels.remove(at: firstItemIndex)
        newModels.insert(firstItem, at: 0)

        return newModels
    }
}
