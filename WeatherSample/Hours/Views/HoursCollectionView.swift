//
//  HoursCollectionView.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 26.02.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

import UIKit

class HoursCollectionView: UICollectionView {
    
    //MARK: Initialization

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        registerNib(for: HourCell.self)
        setLayout()
    }
    
    //MARK: Private
    
    private func setLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        collectionViewLayout = layout
    }
}
