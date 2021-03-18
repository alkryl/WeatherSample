//
//  UIViewController+.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 18.03.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

import UIKit

extension UIViewController {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UIViewController {
    func presentError(_ description: String) {
        let controller = UIAlertController(title: .empty, message: description, preferredStyle: .alert)
        let action = UIAlertAction(title: K.Text.close, style: .default) { (action) in
            controller.dismiss(animated: true, completion: nil)
        }
        controller.addAction(action)
        present(controller, animated: true, completion: nil)
    }
}
