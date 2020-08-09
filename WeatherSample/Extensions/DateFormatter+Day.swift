//
//  DateFormatter+Day.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 03/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

extension DateFormatter {
    func day(from date: Date = Date()) -> String {
        return weekdaySymbols[Calendar.current.component(.weekday, from: date) - 1]
    }
    
    func stringTime(from date: Date) -> String {
        dateFormat = "HH:mm"
        timeZone = TimeZone(abbreviation: "UTC")
        return string(from: date)
    }
}
