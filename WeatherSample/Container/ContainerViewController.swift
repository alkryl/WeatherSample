//
//  ContainerViewController.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 29/06/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import UIKit
import CoreLocation

class ContainerViewController: UITableViewController {
    
    private var configurator = Configurator()
    var presenter: ContainerPresenterProtocol!
        
    //MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        presenter = configurator.containerPresenter(self)
        tableView.register(HeaderCell.nib, forHeaderFooterViewReuseIdentifier: HeaderCell.identifier)
    }
    
    //MARK: Methods
    
    private func createUI() {
        tableView.backgroundView = UIImageView(image: UIImage(named: "background"))
        let toolbar = navigationController?.toolbar as! CustomToolbar
        toolbar.githubButton.addTarget(self, action: #selector(githubButtonOnTap), for: .touchUpInside)
    }
    
    @objc private func githubButtonOnTap() {
        presenter.setPresenter(for: GithubViewController())
    }
}

//MARK: UITableViewDelegate

extension ContainerViewController {
    override func tableView(_ tableView: UITableView,
                            shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return ContainerCell.shouldHighlight
    }
    
    override func tableView(_ tableView: UITableView,
                            heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ContainerCell.height(for: indexPath)
    }
        
    override func tableView(_ tableView: UITableView,
                            heightForHeaderInSection section: Int) -> CGFloat {
        return HeaderCell.height(for: section)
    }
    
    override func tableView(_ tableView: UITableView,
                            viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderCell") as! HeaderCell
        
        [TopViewController.nib, HoursViewController.nib].forEach {
            header.configureHeader(child: $0, parent: self)
        }
        return section == Section.empty ? nil : header
    }
}

//MARK: UITableViewDataSource

extension ContainerViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return section == Section.empty ? 0 : Content.allCases.count
    }
    
    override func tableView(_ tableView: UITableView,
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
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        presenter.didUpdateLocation(manager.location?.coordinate)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        presenter.didFailToUpdateLocation()
    }
}

//MARK: Enums

enum Content: Int, CaseIterable {
    case daysValue = 0, todayValue, infoValue

    static var days:  Int { return Content.daysValue.rawValue }
    static var today: Int { return Content.todayValue.rawValue }
    static var info:  Int { return Content.infoValue.rawValue }
}

enum Section: Int, CaseIterable {
    case emptySection = 0, contentSection

    static var empty: Int   { return Section.emptySection.rawValue }
    static var content: Int { return Section.contentSection.rawValue }
}
