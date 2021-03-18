//
//  TopModelLayer.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 26.02.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

import Foundation

struct TopModelLayer {
    let city: String
    let weather: String
    let degree: String
    let dayOfWeek: String
    let dayTime: String
    let maxDegree: String
    let minDegree: String
    
    //MARK: Initialization
    
    init(_ model: TopModel) {
        self.city = (model.city
                    .components(separatedBy: K.Symbol.slash).last?
                    .replacingOccurrences(of: K.Symbol.underscore, with: K.Symbol.space))
                    .orEmpty

        self.weather = (model.weather?.capitalized).orEmpty
        self.dayOfWeek = DateFormatter().day()
        self.dayTime = Date().event(sunrise: model.sunrise + model.timezoneOffset,
                                    sunset: model.sunset + model.timezoneOffset)
        
        self.degree = model.degree.toInt().toString().withDegree
        self.maxDegree = model.maxDegree.orEmpty.toInt().toString()
        self.minDegree = model.minDegree.orEmpty.toInt().toString()
    }
}
