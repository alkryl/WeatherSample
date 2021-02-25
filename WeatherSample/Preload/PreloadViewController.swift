//
//  PreloadViewController.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 23.02.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

import UIKit

final class PreloadViewController: UIViewController {
    
    var presenter: PreloadPresenterProtocol!
    let configurator: PreloadConfiguratorProtocol = PreloadConfigurator()
    
    //MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.getWeather()
    }
}

//MARK: PreloadViewProtocol

extension PreloadViewController: PreloadViewProtocol {
    func showError(_ description: String) {
        presentError(description)
    }
}
