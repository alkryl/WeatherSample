//
//  InfoModel.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 08/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

struct InfoModel {
    let timezoneOffset: Int
    let sunrise: Int
    let sunset: Int
    let humidity: Int
    let windSpeed: Double
    let windDirection: Int
    let feelsLike: Double
    let precipitation: Int?
    let pressure: Int
    let visibility: Int?
    let uvi: Double
    
    //MARK: Initialization
    
    init(_ weather: WeatherJSON) {
        self.timezoneOffset = weather.timezoneOffset
        self.sunrise = weather.current.sunrise
        self.sunset = weather.current.sunset
        self.humidity = weather.current.humidity
        self.windSpeed = weather.current.windSpeed
        self.windDirection = weather.current.windDirection
        self.feelsLike = weather.current.feelsLike
        self.precipitation = weather.current.precipitation
        self.pressure = weather.current.pressure
        self.visibility = weather.current.visibility
        self.uvi = weather.current.uvi
    }
}
