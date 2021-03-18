//
//  InfoViewController.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 02/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import UIKit

final class InfoViewController: UIViewController {
    
    var presenter: InfoPresenterProtocol!
    let configurator: InfoConfiguratorProtocol = InfoConfigurator()
    
    //MARK: Outlets
    
    @IBOutlet private weak var tableView: InfoTableView!
    
    //MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.getWeather()
    }
}

//MARK: UITableViewDelegate

extension InfoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return presenter.tableView(heightForRowAt: indexPath)
    }
}

//MARK: UITableViewDataSource

extension InfoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.tableView(numberOfRowsInSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InfoCell.identifier,
                                                 for: indexPath) as! InfoCell
        
        let parameters = presenter.infoParametersForCell(at: indexPath)
        cell.viewModel = InfoCellViewModel(parameters: parameters)
        
        return cell
    }
}

//MARK: InfoViewProtocol

extension InfoViewController: InfoViewProtocol { }
