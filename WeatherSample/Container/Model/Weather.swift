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
    let timezoneOffset: Int
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
    let time: Int
    let temp: DayTemp
    let weather: [Weather]
    
    struct DayTemp: Decodable {
        let day: Double
        let night: Double
        let max: Double
        let min: Double
    }
}

//MARK: Extensions

private extension WeatherJSON {
    enum CodingKeys: String, CodingKey {
        case timezone, current, hourly, daily
        case timezoneOffset = "timezone_offset"
    }
}

private extension Current {
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

private extension Daily {
    enum CodingKeys: String, CodingKey {
        case time = "dt"
        case temp, weather
    }
}
