//
//  TodayModelLayer.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 22.02.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

struct TodayModelLayer {
    var weatherInfo: String
    
    //MARK: Initialization
    
    init(_ model: TodayModel) {
        weatherInfo = .empty
        
        if let condition = model.condition {
            weatherInfo += "Today: \(condition) currently".withDot
        }
        
        if let max = model.maxDay {
            weatherInfo += " The high will be \(Int(max))".withDegree.withDot
        }
        
        if let min = model.minNight {
            weatherInfo += " Tonight with a low of \(Int(min))".withDegree.withDot
        }
    }
}
