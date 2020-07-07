//
//  TopViewController.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 29/06/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import UIKit

class TopViewController: UIViewController, TopViewProtocol {
    
    var presenter: TopPresenterProtocol!
        
    //MARK: Outlets
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var maxDegreeLabel: UILabel!
    @IBOutlet weak var minDegreeLabel: UILabel!
    
    //MARK: Methods
    
    func setParameters(city: String, weather: String, degree: Int, day: String,
                       dayTime: String, maxDegree: Int, minDegree: Int) {
        cityLabel.text = city
        weatherLabel.text = description
        degreeLabel.text = "\(degree)°"
        dayLabel.text = day
        todayLabel.text = dayTime
        maxDegreeLabel.text = "\(degree)"
        minDegreeLabel.text = "\(degree)"
        view.isHidden = false
    }
}
