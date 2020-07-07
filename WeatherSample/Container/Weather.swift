//
//  Weather.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 02/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

struct WeatherJSON: Decodable {
    let timezone: String
    let current: Current
    let hourly: [Hours]
    let daily: [Daily]
}

struct Current: Decodable {
    let temp: Double
    let sunrise: Int
    let sunset: Int
    let humidity: Int
    let windDirection: Int
    let windSpeed: Double
    let feelsLike: Double
    let precipitation: Int?
    let pressure: Int
    let visibility: Int?
    let uvi: Double
    let weather: [Weather]
}

struct Weather: Decodable {
    let id: Int
    let main: String
    let descr: String
}

struct Hours: Decodable {
    let time: Int
    let temp: Double
    let weather: [Weather]
}

struct Daily: Decodable {
    let temp: DayTemp
    
    struct DayTemp: Decodable {
        let min: Double
        let max: Double
    }
}

extension Current {
    enum CodingKeys: String, CodingKey {
        case sunrise, sunset, temp, pressure, humidity, uvi, visibility, weather
        case windDirection = "wind_deg"
        case feelsLike = "feels_like"
        case precipitation = "current.rain"
        case windSpeed = "wind_speed"
    }
}

private extension Weather {
    enum CodingKeys: String, CodingKey {
        case main, id
        case descr = "description"
    }
}

private extension Hours {
    enum CodingKeys: String, CodingKey {
        case time = "dt"
        case temp, weather
    }
}
