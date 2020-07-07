//
//  TopModel.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 02/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

struct TopModel {
    let city: String
    let weather: String
    let degree: Int
    let dayOfWeek: String
    let dayTime: String
    let maxDegree: Int
    let minDegree: Int
    
    //MARK: Initialization
    
    init(_ weather: WeatherJSON) {
        self.city = weather.timezone.components(separatedBy: "/").last!
        self.weather = weather.current.weather.first!.descr.capitalized
        self.degree = Int(weather.current.temp)
        self.dayOfWeek = DateFormatter().currentDay
        self.dayTime = Date().dayTime(sunrise: weather.current.sunrise,
                                      sunset: weather.current.sunset)
        self.maxDegree = Int(weather.daily.first!.temp.max)
        self.minDegree = Int(weather.daily.first!.temp.min)
    }
}
