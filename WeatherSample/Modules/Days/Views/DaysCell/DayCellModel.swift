//
//  DayCellModel.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 07/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

struct DayCellModel {
    let day: String
    let id: Int
    let dayDegree: String
    let nightDegree: String
    
    //MARK: Initialization
    
    init(day: String, id: Int, dayDegree: String, nightDegree: String) {
        self.day = day
        self.id = id
        self.dayDegree = dayDegree
        self.nightDegree = nightDegree
    }
}
