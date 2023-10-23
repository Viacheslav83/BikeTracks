//
//  BikeTracksVM.swift
//  BikeTracks
//
//  Created by Viacheslav Markov on 23.10.2023.
//

import Foundation

protocol BikeTracksVMProtocol: AnyObject {
    var delegate: BikeTracksVMDelegating? { get set }
}

protocol BikeTracksVMDelegating: AnyObject {
    
}

final class BikeTracksVM: BikeTracksVMProtocol {
    weak var delegate: BikeTracksVMDelegating?
}
