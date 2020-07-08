//
//  InfoViewController.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 02/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    var presenter: InfoPresenterProtocol!
    
    var displayedData = InfoData()
    
    //MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(InfoCell.nib, forCellReuseIdentifier: InfoCell.identifier)
    }
}

//MARK: InfoViewProtocol methods

extension InfoViewController: InfoViewProtocol {
    func updateDisplayedData(_ data: InfoData) {
        self.displayedData = data
    }
    
    func updateView() {
        tableView.reloadData()
    }
}

//MARK: UITableViewDelegate

extension InfoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return InfoCell.height
    }
}

//MARK: UITableViewDataSource

extension InfoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell",
                                                 for: indexPath) as! InfoCell
        guard let presenter = presenter else { return cell }

        presenter.setPresenter(for: cell, at: indexPath.row)
        
        return cell
    }
}
