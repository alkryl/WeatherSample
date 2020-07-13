//
//  ContainerProtocols.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 02/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation
import CoreLocation

protocol ContainerViewProtocol: AnyObject {
    var presenter: ContainerPresenterProtocol! { get set }
    func showError(message: String)
    func setChildPresenters()
    func showGithubPage(view: GithubViewProtocol)
}

protocol ContainerPresenterProtocol {
    var view: ContainerViewProtocol! { get set }
    init(view: ContainerViewProtocol, configurator: ConfiguratorProtocol)
    func didUpdateLocation(_ location: CLLocationCoordinate2D?)
    func didFailToUpdateLocation()
    func setPresenter(for view: GithubViewProtocol)
}
