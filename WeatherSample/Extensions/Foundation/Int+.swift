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
    func toString() -> String {
        return String(self)
    }
    
    func toDouble() -> Double {
        return Double(self)
    }
}

extension Int {
    func windDirection() -> String {
        switch self {
        case 337...360, 0...22: return "n"
        case 23...67:   return "ne"
        case 68...112:  return "e"
        case 113...157: return "se"
        case 158...202: return "s"
        case 203...247: return "sw"
        case 248...292: return "w"
        case 293...336: return "nw"
        default: return .empty
        }
    }
}
