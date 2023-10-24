//
//  UIViewController+Extension.swift
//  BikeTracks
//
//  Created by Viacheslav Markov on 23.10.2023.
//

import UIKit

extension UIViewController {
    var appDelegate: AppDelegate? {
        UIApplication.shared.delegate as? AppDelegate
    }
    
    func presentBasicAlert(
        title: String = "Error",
        message: String = "Something went wrong.",
        buttonTitle: String = "Okay",
        isAutomaticallyDismissed: Bool = false,
        completion: (() -> Void)? = nil
    ) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        if isAutomaticallyDismissed {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
                alertController.dismiss(animated: true, completion: completion)
            })
        }
        let alertAction = UIAlertAction(title: buttonTitle, style: .default) { _ in
            alertController.dismiss(animated: true, completion: completion)
        }
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
}
