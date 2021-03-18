//
//  UICollectionView+.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 18.03.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

import UIKit

extension UICollectionView {
    func registerNib(for type: UICollectionViewCell.Type) {
        let nib = UINib(nibName: type.identifier, bundle: Bundle.main)
        register(nib, forCellWithReuseIdentifier: type.identifier)
    }
}
