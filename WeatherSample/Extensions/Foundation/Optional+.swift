//
//  Optional+.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 18.03.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

import UIKit

extension Optional where Wrapped == String {
    var orEmpty: String {
        return self ?? .empty
    }
}

extension Optional where Wrapped == CGFloat {
    var orEmpty: CGFloat {
        return self ?? 0
    }
}

extension Optional where Wrapped == Double {
    var orEmpty: Double {
        return self ?? 0
    }
}

extension Optional where Wrapped == Int {
    var orEmpty: Int {
        return self ?? 0
    }
}
