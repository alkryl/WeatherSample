//
//  ContainerTableView.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 26.02.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

import UIKit

class ContainerTableView: UITableView {

    //MARK: Methods
    
    func disableScrolling(_ disable: Bool) {
        if disable {
            contentOffset.y = 0
        }
    }
}
