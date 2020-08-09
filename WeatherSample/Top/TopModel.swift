//
//  TopModel.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 02/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

//MARK: Model

struct TopModel {
    let city: String
    let weather: String
    let degree: Double
    let sunrise: Int
    let sunset: Int
    let maxDegree: Double
    let minDegree: Double
    
    //MARK: Initialization
    
    init(_ weather: WeatherJSON) {
        self.city = weather.timezone
        self.weather = weather.current.weather.first!.descr
        self.degree  = weather.current.temp
        self.sunrise = weather.current.sunrise
        self.sunset  = weather.current.sunset
        self.maxDegree = weather.daily.first!.temp.max
        self.minDegree = weather.daily.first!.temp.min
    }
}

//MARK: Displayed data

struct TopViewData {
    let city: String
    let weather: String
    let degree: Int
    let dayOfWeek: String
    let dayTime: String
    let maxDegree: Int
    let minDegree: Int
    
    //MARK: Initialization
    
    init(_ topModel: TopModel) {
        self.city = topModel.city.components(separatedBy: "/").last!.replacingOccurrences(of: "_", with: " ")
        self.weather = topModel.weather.capitalized
        self.degree = Int(topModel.degree)
        self.dayOfWeek = DateFormatter().day()
        self.dayTime = Date().dayTime(sunrise: topModel.sunrise,
                                      sunset: topModel.sunset)
        self.maxDegree = Int(topModel.maxDegree)
        self.minDegree = Int(topModel.minDegree)
    }
}
