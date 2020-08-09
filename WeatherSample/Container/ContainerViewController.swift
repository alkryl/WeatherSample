//
//  ContainerViewController.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 29/06/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import UIKit
import CoreLocation

class ContainerViewController: UIViewController {
    
    var presenter: ContainerPresenterProtocol!
        
    //MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerHeightConstraint: NSLayoutConstraint!
    
    //MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ContainerPresenter(view: self)
    }
}

//MARK: UITableViewDelegate

extension ContainerViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return ContainerCell.shouldHighlight
    }
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ContainerCell.height
    }
}

//MARK: UITableViewDataSource

extension ContainerViewController: UITableViewDataSource {
    enum TableCells: CaseIterable {
        case Content
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return TableCells.allCases.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContainerCell.identifier, for: indexPath) as! ContainerCell
        
        cell.configureView(with: self)
        
        return cell
    }
}

//MARK: ContainerViewProtocol

extension ContainerViewController: ContainerViewProtocol {
    func updateHeader(with height: Double, blocked: Bool) {
        headerHeightConstraint.constant = CGFloat(height)
        if blocked {
            tableView.contentOffset.y = 0
        }
    }
    
    func showError(message: String) {
        let alert = UIAlertController(title: "Error occured", message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func setChildPresenters() {
        children.forEach { child in
            if child.isKind(of: UITableViewController.self) {
                child.children.forEach {
                    presenter.setChildPresenter(for: $0)
                }
            } else {
                presenter.setChildPresenter(for: child)
            }
        }
    }
}

//MARK: CLLocationManagerDelegate

extension ContainerViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        presenter.didUpdateLocation(manager.location?.coordinate)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        presenter.didFailToUpdateLocation()
    }
}

//MARK: UIScrollViewDelegate

extension ContainerViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        presenter.calculateHeightWithParameters(
            heightConstant: Double(headerHeightConstraint.constant),
            contentOffset: Double(scrollView.contentOffset.y),
            barHeight: Double(navigationController?.statusBarHeight ?? 0)
        )
    }
}
