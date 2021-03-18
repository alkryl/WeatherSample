//
//  ContainerCell.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 13/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import UIKit

class ContainerCell: UITableViewCell {
    
    var isOneSubview: Bool {
        return contentView.subviews.count == 1
    }
    
    //MARK: Methods
    
    func add(_ view: UIView) {
        contentView.addSubview(view)
    }
}
