//
//  DaysModelLayer.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 15.03.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

import Foundation

typealias DayParameters = (day: String, id: Int?, dayTemperature: String, nightTemperature: String)

struct DaysModelLayer {
    var weatherForecast = [DayInfo]()
    
    private var model: DaysModel!

    //MARK: Initialization

    init(_ model: DaysModel) {
        self.model = model
        weatherForecast = weatherList()
    }
    
    //MARK: Private
    
    private func weatherList() -> [DayInfo] {
        var daysList = [DayInfo]()
        
        func append(_ day: DayInfo) {
            daysList.append(day)
        }
        
        func dayInfo(_ parameters: DayParameters) -> DayInfo {
            return DayInfo(parameters)
        }
        
        for item in model.daily {
            let params: DayParameters = (DateFormatter().day(from: item.time.date()),
                                         item.weather.first?.id,
                                         item.temp.day.toInt().toString(),
                                         item.temp.night.toInt().toString())
            append(dayInfo(params))
        }
        
        if !daysList.isEmpty {
            daysList.removeFirst()
        }
                
        return daysList
    }
}

struct DayInfo {
    let day: String
    let id: Int
    let dayDegree: String
    let nightDegree: String
    
    //MARK: Initialization
    
    fileprivate init(_ parameters: DayParameters) {
        day = parameters.day
        id = parameters.id.orEmpty
        dayDegree = parameters.dayTemperature
        nightDegree = parameters.nightTemperature
    }
}
