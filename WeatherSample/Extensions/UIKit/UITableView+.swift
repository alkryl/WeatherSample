//
//  UITableView+.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 18.03.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

import UIKit

extension UITableView {
    func registerNib(for type: UITableViewCell.Type) {
        let nib = UINib(nibName: type.identifier, bundle: Bundle.main)
        register(nib, forCellReuseIdentifier: type.identifier)
    }
}
