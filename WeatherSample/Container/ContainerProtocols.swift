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
    func updateHeader(with height: Double, blocked: Bool)
    func showError(message: String)
    func setChildPresenters()
}

protocol ContainerPresenterProtocol {
    var view: ContainerViewProtocol! { get set }
    init(view: ContainerViewProtocol)
    func didUpdateLocation(_ location: CLLocationCoordinate2D?)
    func didFailToUpdateLocation()
    func setChildPresenter(for view: AnyObject)
    func calculateHeightWithParameters(heightConstant: Double,
                                       contentOffset: Double,
                                       barHeight: Double)
}
