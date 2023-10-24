//
//  BikeTracksCoordinator.swift
//  BikeTracks
//
//  Created by Viacheslav Markov on 23.10.2023.
//

import UIKit
import MapKit

final class BikeTracksCoordinator: CoordinatorProtocol {
    var childCoordinators = [CoordinatorProtocol]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = BikeTracksVM()
        let viewController = BikeTracksVC(viewModel: viewModel)
        viewController.coordinator = self
        
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func openMapForPlace(item: TrackModel) {
        guard
            let latitude = item.latitude,
            let longitude = item.longitude,
            let companyName = item.name
        else {
            navigationController.presentBasicAlert(title: "Error",
                                                   message: "Problems with location",
                                                   buttonTitle: "Okay",
                                                   isAutomaticallyDismissed: true)
            return
        }
        
        let latitudeDegrees: CLLocationDegrees = Double(latitude)
        let longitudeDegrees: CLLocationDegrees = Double(longitude)
        let regionDistance:CLLocationDistance = 1000
        
        let coordinates = CLLocationCoordinate2DMake(latitudeDegrees, longitudeDegrees)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = companyName
        mapItem.openInMaps(launchOptions: options)
    }
}
