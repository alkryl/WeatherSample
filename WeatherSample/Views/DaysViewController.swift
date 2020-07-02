//
//  DaysViewController.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 02/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import UIKit

class DaysViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel(frame: CGRect(x: 20, y: 150, width: 200, height: 30))
        label.text = "DAYS"
        label.textColor = .black
        view.addSubview(label)
    }
}
