//
//  TodayViewController.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 02/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController {
    
    static var nib: TodayViewController {
        return UIStoryboard().main.instantiateViewController(identifier: "TodayViewController")
    }
    var presenter: TodayPresenterProtocol!
    
    //MARK: Outlets
    
    @IBOutlet weak var weatherLabel: UILabel!
}

//MARK: TodayViewProtocol methods

extension TodayViewController: TodayViewProtocol {
    func setWeatherDescription(_ descr: String) {
        weatherLabel.text = descr
    }
    
    func showView() {
        view.isHidden = false
    }
}
