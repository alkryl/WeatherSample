//
//  TodayViewController.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 02/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel(frame: CGRect(x: 20, y: 20, width: 200, height: 30))
        label.text = "TODAY"
        label.textColor = .black
        view.addSubview(label)
    }
}
