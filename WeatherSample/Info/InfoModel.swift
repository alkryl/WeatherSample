//
//  InfoModel.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 08/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

//MARK: Model

struct InfoModel {
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

//MARK: Displayed data

private typealias Data = [(Keys, String)]
typealias InfoData = [(name: String, parameter: String)]

struct InfoViewData {
    private var data = Data()
    
    var info: InfoData {
        return data.map { ($0.0.rawValue.uppercased(), $0.1) }
    }
        
    //MARK: Initialization
    
    init(_ model: InfoModel) {
        data.append((.sunrise, model.sunrise.date().exactTime()))
        data.append((.sunset, model.sunset.date().exactTime()))
        data.append((.humidity, "\(model.humidity) %"))
        data.append((.wind, "\(model.windDirection.windDirection()) \(Int(model.windSpeed)) m/s"))
        data.append((.feelsLike, "\(Int(model.feelsLike))°"))
        data.append((.precipitation,
                     "\(model.precipitation == nil ? 0 : model.precipitation!) cm"))
        data.append((.pressure, "\(Int(Double(model.pressure) * 0.750064)) mm Hg"))
        data.append((.visibility,
                     model.visibility == nil ? "- km" : "\(model.visibility! / 1000) km"))
        data.append((.uvi, "\(Int(model.uvi))"))
    }
}

private enum Keys: String {
    case sunrise = "sunrise"
    case sunset  = "sunset"
    case humidity = "humidity"
    case wind = "wind"
    case feelsLike = "feels like"
    case precipitation = "precipitation"
    case pressure = "pressure"
    case visibility = "visibility"
    case uvi = "uv index"
}
