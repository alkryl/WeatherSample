//
//  BottomViewController.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 20/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import UIKit

final class BottomViewController: UIViewController {
    
    var presenter: BottomPresenterProtocol!
    let configurator: BottomConfiguratorProtocol = BottomConfigurator()
    
    //MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
    }
    
    //MARK: Actions
    
    @IBAction func githubOnTap(_ sender: UIButton) {
        presenter.githubButtonClicked()
    }
}

//MARK: BottomViewProtocol

extension BottomViewController: BottomViewProtocol { }
