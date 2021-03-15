//
//  HoursModel.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 05/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

struct HoursModel {
    let timezoneOffset: Int
    let sunrise: Int
    let sunset: Int
    let hourly: [Hours]
    
    //MARK: Initialization
    
    init(_ weather: WeatherJSON) {
        self.timezoneOffset = weather.timezoneOffset
        self.sunrise = weather.current.sunrise
        self.sunset  = weather.current.sunset
        self.hourly  = weather.hourly
    }
}
