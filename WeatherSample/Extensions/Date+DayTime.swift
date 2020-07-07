//
//  Date+DayTime.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 03/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

extension Date {
    func component(_ component: Calendar.Component) -> Int {
        return Calendar.current.component(component, from: self)
    }
    
    func exactTime() -> String {
        return "\(component(.hour)):\(component(.minute))"
    }
    
    func dayTime(sunrise: Int, sunset: Int) -> String {
        let sunriseTime = sunrise.date().component(.hour)
        let sunsetTime  = sunset.date().component(.hour)
        let currentTime = component(.hour)
        
        return (currentTime > sunsetTime) || (currentTime < sunriseTime) ? "NIGHT" : "TODAY"
    }
}
