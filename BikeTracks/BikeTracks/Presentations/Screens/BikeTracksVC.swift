//
//  BikeTracksVC.swift
//  BikeTracks
//
//  Created by Viacheslav Markov on 23.10.2023.
//

import UIKit

final class BikeTracksVC: UIViewController {
    var coordinator: BikeTracksCoordinator?
    
    private let bikeTracksView: BikeTracksView = {
        let view = BikeTracksView()
        view.backgroundColor = .white
        return view
    }()
    
    var viewModel: BikeTracksVMProtocol
    
    init(viewModel: BikeTracksVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

private extension BikeTracksVC {
    func setupView() {
//        let models = viewModel.data
//        onboardingView.configureScrollViewContent(models: models)
//        onboardingView.delegate = self
//        view.add([onboardingView])
//        onboardingView.autoPinEdgesToSuperView()
    }
}
