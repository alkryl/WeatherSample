//
//  HourCellModel.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 07/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

struct HourCellModel {
    let id: Int
    let hour: String
    let temp: String
    
    //MARK: Initialization
    
    init(hour: String, temp: String, id: Int) {
        self.hour = hour
        self.temp = temp
        self.id = id
    }
}

