//
//  HourCell.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 05/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import UIKit

class HourCell: UICollectionViewCell {
    
    static var nib: UINib {
        return UINib(nibName: "HourCell", bundle: Bundle.main)
    }
    static let identifier = "HourCell"
    static let size = CGSize(width: 60, height: 100)
    
    //MARK: Outlets
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var degreeLabel: UILabel!
    
    //MARK: Reusable
    
    override func prepareForReuse() {
        super.prepareForReuse()
        hourLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        iconView.image = nil
        degreeLabel.font = UIFont.systemFont(ofSize: 17)
    }
    
    //MARK: Methods
    
    func setParameters(hour: String, temp: String, id: Int) {
        if hour == "Now" {
            changeFont()
        }
        hourLabel.text = hour   //UTC time!
        iconView.image = self.icon(code: id)
        degreeLabel.text = temp
        view.isHidden = false
    }
    
    func changeFont() {
        hourLabel.font = UIFont.boldSystemFont(ofSize: 15)
        degreeLabel.font = UIFont.boldSystemFont(ofSize: 17)
    }
    
    //MARK: Private
    
    private func icon(code: Int) -> UIImage? {
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
