//
//  DaysModel.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 07/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

//MARK: Model

struct DaysModel {
    var daily: [Daily]
        
    //MARK: Initialization
    
    init(_ weather: WeatherJSON) {
        self.daily = weather.daily
    }
}

//MARK: Displayed data

struct DaysWeather {
    var daysForecast = [DaysViewData]()

    //MARK: Initialization

    init(_ model: DaysModel) {
        model.daily.forEach {
            daysForecast.append(DaysViewData(day: $0.time,
                                             id: $0.weather.first!.id,
                                             dayDegree: $0.temp.day,
                                             nightDegree: $0.temp.night))
        }
        daysForecast.removeFirst()
    }
}

struct DaysViewData {
    let day: String
    let id: Int
    let dayDegree: String
    let nightDegree: String

    //MARK: Initialization

    init(day: Int, id: Int, dayDegree: Double, nightDegree: Double) {
        self.day = DateFormatter().day(from: day.date())
        self.id = id
        self.dayDegree = "\(Int(dayDegree))"
        self.nightDegree = "\(Int(nightDegree))"
    }
}
