//
//  DaysViewController.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 02/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import UIKit

class DaysViewController: UIViewController {
    
    var presenter: DaysPresenterProtocol!
    
    var displayedData = [DaysViewData]()
    
    //MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(DayCell.nib, forCellReuseIdentifier: DayCell.identifier)
    }
}

//MARK: DaysViewProtocol methods

extension DaysViewController: DaysViewProtocol {
    func updateDisplayedData(_ data: [DaysViewData]) {
        self.displayedData = data
    }
    
    func updateView() {
        tableView.reloadData()
    }
}

//MARK: UITableViewDelegate

extension DaysViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return DayCell.height
    }
}

//MARK: UITableViewDataSource

extension DaysViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DayCell",
                                                 for: indexPath) as! DayCell
        guard let presenter = presenter else { return cell }

        presenter.setPresenter(for: cell, at: indexPath.row)
        
        return cell
    }
}
