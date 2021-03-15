//
//  DaysModel.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 07/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

struct DaysModel {
    var daily: [Daily]
        
    //MARK: Initialization
    
    init(_ weather: WeatherJSON) {
        self.daily = weather.daily
    }
}
