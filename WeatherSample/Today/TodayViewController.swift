//
//  TodayViewController.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 02/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import UIKit

final class TodayViewController: UIViewController {
    
    var presenter: TodayPresenterProtocol!
    let configurator: TodayConfiguratorProtocol = TodayConfigurator()
    
    //MARK: Outlets
    
    @IBOutlet private weak var weatherLabel: UILabel!
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.getWeather()
    }
}

//MARK: TodayViewProtocol

extension TodayViewController: TodayViewProtocol {
    func setWeatherDescription(_ text: String) {
        weatherLabel.text = text
    }
}
