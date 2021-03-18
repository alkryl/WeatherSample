//
//  UIImage+.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 07/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import UIKit

extension UIImage {
    static func icon(code: Int) -> UIImage? {
        func image(_ name: String) -> UIImage? {
            return UIImage(named: name)
        }
        
        switch code {
        case 200...232:
            return image(K.Image.thunderstorm)
        case 300...321:
            return image(K.Image.rainCloud)
        case 500, 520:
            return image(K.Image.lightRain)
        case 501, 521:
            return image(K.Image.moderateRain)
        case 502...511, 522...531:
            return image(K.Image.heavyRain)
        case 600...622:
            return image(K.Image.snow)
        case 701...781:
            return image(K.Image.haze)
        case 800:
            return image(K.Image.clear)
        case 801...802:
            return image(K.Image.fewClouds)
        case 803...804:
            return image(K.Image.clouds)
        case 900:
            return image(K.Image.sunrise)
        case 901:
            return image(K.Image.sunset)
        default:
            return UIImage()
        }
    }
}
