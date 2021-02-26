//
//  TopViewController.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 29/06/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import UIKit

final class TopViewController: UIViewController {

    var presenter: TopPresenterProtocol!
    let configurator: TopConfiguratorProtocol = TopConfigurator()
        
    //MARK: Outlets
    
    @IBOutlet private var viewsCollection: [UILabel]!
    
    //MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.getWeather()
    }
}

//MARK: TopViewProtocol

extension TopViewController: TopViewProtocol {
    func configureView() {
        viewsCollection.forEach { label in
            label.text = presenter.getText(for: label.tag)
        }
    }
    
    func updateAlpha(_ value: FloatType) {
        viewsCollection.forEach { view in
            if presenter.shouldChangeAlpha(for: view.tag) == true {
                view.alpha = value
            }
        }
    }
}
