//
//  UINavigationController+StatusBar.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 20/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import UIKit

extension UINavigationController {
    var statusBarHeight: CGFloat {
        if #available(iOS 13.0, *) {
            return view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        } else {
            return UIApplication.shared.statusBarFrame.height
        }
    }
}

extension UIViewController {
    func presentError(_ description: String) {
        let controller = UIAlertController(title: .empty, message: description, preferredStyle: .alert)
        let action = UIAlertAction(title: Text.close, style: .default) { (action) in
            controller.dismiss(animated: true, completion: nil)
        }
        controller.addAction(action)
        present(controller, animated: true, completion: nil)
    }
}
