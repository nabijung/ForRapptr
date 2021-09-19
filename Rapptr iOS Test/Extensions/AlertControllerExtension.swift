//
//  AlertControllerExtension.swift
//  Rapptr iOS Test
//
//  Created by nabi jung on 9/18/21.
//

import Foundation
import UIKit

extension UIViewController {
    func presentSimpleAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
