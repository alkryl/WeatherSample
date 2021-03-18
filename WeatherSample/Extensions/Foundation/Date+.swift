//
//  Date+.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 03/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

extension Date {
    func component(_ component: Calendar.Component) -> String {
        let date = DateFormatter().time(from: self)
        let params = date.components(separatedBy: K.Symbol.colon)
        let hour = params.first
        let minute = params.last
        return (component == .hour ? hour : minute).orEmpty
    }
    
    func exactTime() -> String {
        return "\(component(.hour)):\(component(.minute))"
    }
    
    func event(sunrise: Int, sunset: Int) -> String {
        let sunrise = sunrise.date().component(.hour)
        let sunset  = sunset.date().component(.hour)
        let current = component(.hour)
        
        return (current > sunset) || (current < sunrise) ? K.Text.night : K.Text.today
    }
}
