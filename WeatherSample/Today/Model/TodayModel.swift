//
//  TodayModel.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 07/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

struct TodayModel {
    let condition: String?
    let maxDay: Double?
    let minNight: Double?
    
    //MARK: Initialization
    
    init(_ weather: WeatherJSON) {
        self.condition = weather.current.weather.first?.main
        self.maxDay    = weather.daily.first?.temp.max
        self.minNight  = weather.daily.first?.temp.min
    }
}
