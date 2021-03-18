//
//  HoursModelLayer.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 26.02.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

typealias HourParameters = (id: Int?, time: String, temperature: String)

struct HoursModelLayer {
    var weatherForecast: [HourInfo]!
    
    private var model: HoursModel!
    private let numberOfElements = 26

    //MARK: Initialization

    init(_ model: HoursModel) {
        self.model = model
        weatherForecast = weatherList()
    }
    
    //MARK: Private
    
    private func weatherList() -> [HourInfo] {
        var hoursList = [HourInfo]()
        
        func append(_ hour: HourInfo) {
            hoursList.append(hour)
        }
        
        func hourInfo(_ parameters: HourParameters) -> HourInfo {
            return HourInfo(parameters)
        }
        
        func truncated(list: [HourInfo], count: Int) -> [HourInfo] {
            return Array(list.prefix(count))
        }
        
        let offset = model.timezoneOffset
        
        let sunriseDate = (model.sunrise + offset).date()
        let sunsetDate = (model.sunset + offset).date()
        
        for item in model.hourly {
            let localTime = (item.time + offset).date().component(.hour)
            
            //each hour
            let params: HourParameters =
                (item.weather.first?.id,
                 hoursList.isEmpty ? K.Weather.Text.now : localTime,
                 item.temp.toInt().toString().withDegree)
            
            append(hourInfo(params))
            
            //event
            let sunriseHour = sunriseDate.component(.hour)
            let sunsetHour  = sunsetDate.component(.hour)
                        
            var eventParams: HourParameters!

            if localTime == sunriseHour {   //sunrise
                eventParams = (K.Weather.ID.sunrise, sunriseDate.exactTime(), K.Weather.Text.sunrise)
            } else if localTime == sunsetHour {
                eventParams = (K.Weather.ID.sunset, sunsetDate.exactTime(), K.Weather.Text.sunset)
            } else {
                continue
            }
            
            append(hourInfo(eventParams))
        }
        
        return truncated(list: hoursList, count: numberOfElements)
    }
}

struct HourInfo {
    let weatherCode: Int
    let hour: String
    let temperature: String

    //MARK: Initialization
    
    fileprivate init(_ parameters: HourParameters) {
        self.weatherCode = parameters.id.orEmpty
        self.hour = parameters.time
        self.temperature = parameters.temperature
    }
}

