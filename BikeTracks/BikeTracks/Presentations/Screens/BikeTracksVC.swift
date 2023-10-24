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
        viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        viewModel.fetchTracks()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        title = "Bike tracks"
    }
}

//MARK: - BikeTracksVC
private extension BikeTracksVC {
    func setupView() {
        view.backgroundColor = .white
        view.add([
            bikeTracksView
        ])
        bikeTracksView.autoPinSafeEdgesToSuperView(topConstant: 16)
        
        bikeTracksView.delegate = self
    }
}

//MARK: - BikeTracksVMDelegating
extension BikeTracksVC: BikeTracksVMDelegating {
    func didUpdatedDataSource(models: [TrackModel]) {
        bikeTracksView.applySnapshot(items: models)
    }
    
    func showError(message: String) {
        presentBasicAlert(message: message, isAutomaticallyDismissed: true) {
            print("presentBasicAlert")
        }
    }
}

//MARK: - BikeTracksViewDelegating
extension BikeTracksVC: BikeTracksViewDelegating {
    func didTapItem(_ sender: BikeTracksView, item: TrackModel) {
        guard item.emptySlots != 0 else {
            presentBasicAlert(title: "No Empty Slots",
                              message: "Sorry, you should chose another track",
                              buttonTitle: "Okay",
                              isAutomaticallyDismissed: true)
            return
        }
        
        coordinator?.openMapForPlace(item: item)
    }
}
