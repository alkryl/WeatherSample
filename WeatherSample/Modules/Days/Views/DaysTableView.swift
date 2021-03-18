//
//  DaysTableView.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 15.03.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

import UIKit

class DaysTableView: UITableView {

    //MARK: Initialization

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        registerNib(for: DayCell.self)
    }
}
