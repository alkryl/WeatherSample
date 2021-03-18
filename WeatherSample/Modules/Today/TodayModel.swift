//
//  TodayModel.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 07/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

//MARK: Model

struct TodayModel {
    let condition: String
    let maxDay: Double
    let minNight: Double
    
    //MARK: Initialization
    
    init(_ weather: WeatherJSON) {
        self.condition = weather.current.weather.first!.main
        self.maxDay = weather.daily.first!.temp.max
        self.minNight = weather.daily.first!.temp.min
    }
}

//MARK: Displayed data

struct TodayViewData {
    let weatherDescription: String
    
    //MARK: Initialization
    
    init(_ model: TodayModel) {
        let condition = model.condition
        let maxDay = Int(model.maxDay)
        let minNight = Int(model.minNight)
        
        weatherDescription = "Today: \(condition) currently. The high will be \(maxDay)°. Tonight will be with a low of \(minNight)°."
    }
}
