//
//  Int+Date.swift
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
