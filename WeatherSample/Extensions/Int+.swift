//
//  Int+.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 06/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

extension Int {
    func date() -> Date {
        return Date(timeIntervalSince1970: TimeInterval(self))
    }
}

extension Int {
    func windDirection() -> String {
        switch self {
        case 337...360, 0...22: return "N"
        case 23...67:  return "NE"
        case 68...112:  return "E"
        case 113...157: return "SE"
        case 158...202: return "S"
        case 203...247: return "SW"
        case 248...292: return "W"
        case 293...336: return "NW"
        default: return ""
        }
    }
}
