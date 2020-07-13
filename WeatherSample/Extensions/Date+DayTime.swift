//
//  Date+DayTime.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 03/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

extension Date {
    func component(_ component: Calendar.Component) -> String {
        let strDate = DateFormatter().stringTime(from: self)
        let params = strDate.components(separatedBy: ":")
        let hour = params.first!
        let minute = params.last!
        return component == .hour ? hour : minute
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
