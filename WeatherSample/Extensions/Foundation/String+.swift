//
//  String+.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 18.03.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

import Foundation

extension String {
    static let empty = ""
}

extension String {
    var withDegree: String {
        return self + "°"
    }
    
    var withDot: String {
        return self + "."
    }
    
    var withPercent: String {
        return self + " %"
    }
    
    var withSpace: String {
        return self + " "
    }
    
    var withMetrePerSecond: String {
        return self + " m/s"
    }
    
    var withCm: String {
        return self + " cm"
    }
    
    var withKm: String {
        return self + " km"
    }
    
    var withMmHg: String {
        return self + " mm Hg"
    }
}
