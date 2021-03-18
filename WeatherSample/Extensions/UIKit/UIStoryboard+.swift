//
//  UIStoryboard+.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 18.03.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

import Foundation

extension UIStoryboard {
    func instantiate(_ type: UIViewController.Type) -> UIViewController? {
        return instantiateViewController(identifier: type.identifier)
    }
}
