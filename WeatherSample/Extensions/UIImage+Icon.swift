//
//  UIImage+Icon.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 07/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import UIKit

extension UIImage {
    func icon(code: Int) -> UIImage? {
        switch code {
        case 200...232: return UIImage(named: "thunderstorm")
        case 300...321: return UIImage(named: "rainCloud")
        case 500, 520: return UIImage(named: "lightRain")
        case 501, 521: return UIImage(named: "moderateRain")
        case 502...511, 522...531: return UIImage(named: "heavyRain")
        case 600...622: return UIImage(named: "snow")
        case 701...781: return UIImage(named: "haze")
        case 800: return UIImage(named: "clear")
        case 801...802: return UIImage(named: "fewClouds")
        case 803...804: return UIImage(named: "clouds")
        case 900: return UIImage(named: "sunrise")
        case 901: return UIImage(named: "sunset")
        default: return UIImage()
        }
    }
}
