//
//  AlertManager.swift
//  Awesome Places
//
//  Created by Gaurav Patel on 13/03/25.
//

import UIKit

final class AlertManager {
    
    // Singleton instance
    static let shared = AlertManager()
    
    private init() {}
    
    func showAlert(on viewController: UIViewController, title: String, message: String, buttonTitle: String = "OK", completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Add the action to the alert
        let action = UIAlertAction(title: buttonTitle, style: .default) { _ in
            // Execute any completion handler if provided
            completion?()
        }
        
        alert.addAction(action)
        
        // Present the alert
        viewController.present(alert, animated: true, completion: nil)
    }
}
