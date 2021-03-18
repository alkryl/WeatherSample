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
            return (view.window?.windowScene?.statusBarManager?.statusBarFrame.height).orEmpty
        } else {
            return UIApplication.shared.statusBarFrame.height
        }
    }
}
