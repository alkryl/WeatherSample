//
//  HoursModel.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 05/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

//MARK: Model

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

//MARK: Displayed data

struct HoursWeather {
    let hoursForecast: [HoursViewData]!

    //MARK: Initialization

    init(_ model: HoursModel) {
        var hoursWeather = [HoursViewData]()
        
        let offset = model.timezoneOffset
        
        let sunriseDate = (model.sunrise + offset).date()
        let sunsetDate = (model.sunset + offset).date()

        model.hourly.forEach {
            let localTime = $0.time + offset
            let itemHour = localTime.date().component(.hour)

            hoursWeather.append(HoursViewData(time: hoursWeather.isEmpty ? "Now" : localTime,
                                              temp: $0.temp, id: $0.weather.first!.id))

            if itemHour == sunriseDate.component(.hour) {
                hoursWeather.append(HoursViewData(time: sunriseDate.exactTime(),
                                                  temp: "Sunrise", id: 900))
            } else if itemHour == sunsetDate.component(.hour) {
                hoursWeather.append(HoursViewData(time: sunsetDate.exactTime(),
                                                  temp: "Sunset", id: 901))
            }
        }
        hoursForecast = Array(hoursWeather.prefix(26))
    }
}

struct HoursViewData {
    let id: Int
    let hour: String
    let temp: String

    //MARK: Initialization

    init(time: Any, temp: Any, id: Int) {
        if let time = time as? Int {
            self.hour = String(describing: time.date().component(.hour))
        } else {
            self.hour = time as! String
        }

        if let temp = temp as? Double {
            self.temp = "\(Int(temp))°"
        } else {
            self.temp = temp as! String
        }

        self.id = id
    }
}
