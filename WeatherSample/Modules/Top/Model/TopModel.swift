//
//  TopModel.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 02/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

struct TopModel {
    let city: String
    let weather: String?
    let degree: Double
    let timezoneOffset: Int
    let sunrise: Int
    let sunset: Int
    let maxDegree: Double?
    let minDegree: Double?
    
    //MARK: Initialization
    
    init(_ weather: WeatherJSON) {
        self.city = weather.timezone
        self.weather = weather.current.weather.first?.descr
        self.degree  = weather.current.temp
        self.timezoneOffset = weather.timezoneOffset
        self.sunrise = weather.current.sunrise
        self.sunset  = weather.current.sunset
        self.maxDegree = weather.daily.first?.temp.max
        self.minDegree = weather.daily.first?.temp.min
    }
}
