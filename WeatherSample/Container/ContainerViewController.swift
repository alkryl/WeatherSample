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
        presenter = Configurator().containerPresenter(self)
        createUI()
    }
    
    //MARK: Methods
    
    private func createUI() {
        let toolbar = navigationController?.toolbar as! CustomToolbar
        toolbar.githubButton.addTarget(self, action: #selector(githubButtonOnTap), for: .touchUpInside)
    }
    
    @objc private func githubButtonOnTap() {
        presenter.setPresenter(for: GithubViewController())
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
        return ContainerCell.height(for: indexPath)
    }
}

//MARK: UITableViewDataSource

extension ContainerViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return Content.allCases.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContainerCell.identifier, for: indexPath) as! ContainerCell
        
        var vc: UIViewController!
  
        switch indexPath.row {
        case Content.days:  vc = DaysViewController.nib
        case Content.today: vc = TodayViewController.nib
        case Content.info:  vc = InfoViewController.nib
        default: return cell
        }
        cell.configureView(child: vc, parent: self, path: indexPath)
        
        return cell
    }
}

//MARK: ContainerViewProtocol methods

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
        children.forEach {
            presenter.setChildPresenter(for: $0)
        }
    }
    
    func showGithubPage(view: GithubViewProtocol) {
        present(view as! UIViewController, animated: true, completion: nil)
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
        let y = scrollView.contentOffset.y
        let topViewHeight = Double(headerHeightConstraint.constant - y)
        let barHeight = Double(44.0 + (navigationController?.statusBarHeight ?? 0))
                
        presenter.calculateHeight(topViewHeight, barHeight: barHeight)
    }
}

//MARK: Enums

enum Content: Int, CaseIterable {
    case daysValue = 0, todayValue, infoValue

    static var days:  Int { return Content.daysValue.rawValue }
    static var today: Int { return Content.todayValue.rawValue }
    static var info:  Int { return Content.infoValue.rawValue }
}
