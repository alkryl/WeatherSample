//
//  DaysModel.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 07/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

struct DaysModel {
    var daysWeather = [DaysWeather]()
        
    //MARK: Initialization
    
    init(_ weather: WeatherJSON) {
        weather.daily.forEach {
            daysWeather.append(DaysWeather(day: $0.time,
                                           id: $0.weather.first!.id,
                                           dayDegree: $0.temp.day,
                                           nightDegree: $0.temp.night))
        }
        daysWeather.removeFirst()
    }
}

struct DaysWeather {
    let day: String
    let id: Int
    let dayDegree: String
    let nightDegree: String
    
    //MARK: Initialization
    
    init(day: Int, id: Int, dayDegree: Double, nightDegree: Double) {
        self.day = DateFormatter().day(from: day.date())
        self.id = id
        self.dayDegree = "\(Int(dayDegree))"
        self.nightDegree = "\(Int(nightDegree))"
    }
}
