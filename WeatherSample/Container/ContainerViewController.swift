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
            if let view = $0 as? TopViewProtocol {
                view.presenter = configurator.topPresenter
                configurator.topPresenter.view = view
            } else if let view = $0 as? HoursViewProtocol {
                view.presenter = configurator.hoursPresenter
                configurator.hoursPresenter.view = view
            } else if let view = $0 as? DaysViewProtocol {
                view.presenter = configurator.daysPresenter
                configurator.daysPresenter.view = view
            } else if let view = $0 as? TodayViewProtocol {
                view.presenter = configurator.todayPresenter
                configurator.todayPresenter.view = view
            } else if let view = $0 as? InfoViewProtocol {
                view.presenter = configurator.infoPresenter
                configurator.infoPresenter.view = view
            }
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
