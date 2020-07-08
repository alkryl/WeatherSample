//
//  TopProtocols.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 02/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

protocol TopViewProtocol: AnyObject {
    var presenter: TopPresenterProtocol! { get set }
    func setParameters(city: String, weather: String, degree: Int, day: String,
                       dayTime: String, maxDegree: Int, minDegree: Int)
    func showView()
}

protocol TopPresenterProtocol {
    var view: TopViewProtocol! { get set }
    init(model: TopModel)
    func updateView()
}
