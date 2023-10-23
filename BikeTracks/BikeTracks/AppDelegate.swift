//
//  AppDelegate.swift
//  BikeTracks
//
//  Created by Viacheslav Markov on 23.10.2023.
//

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    lazy var window: UIWindow? = .init(frame: UIScreen.main.bounds)
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        showBikeTracksVC()
        
        return true
    }
}

private extension AppDelegate {
    private func showBikeTracksVC() {
        let navigationController = UINavigationController()
        let bikeTracksCoordinator = BikeTracksCoordinator(navigationController: navigationController)
        bikeTracksCoordinator.start()
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
