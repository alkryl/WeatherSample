//
//  HoursModel.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 05/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

struct HoursModel {
    var hoursWeather = [HoursWeather]()
    
    //MARK: Initialization
    
    init(_ weather: WeatherJSON) {
        let sunriseDate = weather.current.sunrise.date()
        let sunsetDate = weather.current.sunset.date()
                
        weather.hourly.forEach {
            let itemHour = $0.time.date().component(.hour)
            
            self.hoursWeather.append(HoursWeather(time: hoursWeather.isEmpty ? "Now" : $0.time,
                                                  temp: $0.temp, id: $0.weather.first!.id))
            
            if itemHour == sunriseDate.component(.hour) {
                self.hoursWeather.append(HoursWeather(time: sunriseDate.exactTime(),
                                                      temp: "Sunrise", id: 900))
            } else if itemHour == sunsetDate.component(.hour) {
                self.hoursWeather.append(HoursWeather(time: sunsetDate.exactTime(),
                                                      temp: "Sunset", id: 901))
            }
        }
    }
}

struct HoursWeather {
    let id: Int
    let time: String
    let temp: String
    
    //MARK: Initialization
    
    init(time: Any, temp: Any, id: Int) {
        if let time = time as? Int {
            self.time = String(describing: time.date().component(.hour))
        } else {
            self.time = time as! String
        }
        
        if let temp = temp as? Double {
            self.temp = "\(Int(temp))°"
        } else {
            self.temp = temp as! String
        }
        
        self.id = id
    }
}
