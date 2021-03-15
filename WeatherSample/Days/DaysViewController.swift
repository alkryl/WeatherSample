//
//  DaysViewController.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 02/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import UIKit

final class DaysViewController: UIViewController {
    
    var presenter: DaysPresenterProtocol!
    let configurator: DaysConfiguratorProtocol = DaysConfigurator()
    
    //MARK: Outlets
    
    @IBOutlet weak var tableView: DaysTableView!
    
    //MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.getWeather()
    }
}

//MARK: UITableViewDelegate

extension DaysViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return presenter.tableView(heightForRowAt: indexPath)
    }
}

//MARK: UITableViewDataSource

extension DaysViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.tableView(numberOfRowsInSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DayCell.identifier,
                                                 for: indexPath) as! DayCell

        let parameters = presenter.dayParametersForCell(at: indexPath)
        cell.viewModel = DayCellViewModel(parameters: parameters)
        
        return cell
    }
}

//MARK: DaysViewProtocol

extension DaysViewController: DaysViewProtocol { }
