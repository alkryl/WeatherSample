//
//  DateFormatter+Day.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 03/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

extension DateFormatter {
    var currentDay: String {
        return self.weekdaySymbols[Calendar.current.component(.weekday, from: Date()) - 1]
    }
}
