//
//  TodayProtocols.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 07/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

protocol TodayConfiguratorProtocol: class {
    func configure(with controller: TodayViewController)
}

protocol TodayPresenterProtocol: class {
    var router: TodayRouterProtocol! { get set }
    func getWeather()
    func configureView(with text: String)
}

protocol TodayViewProtocol: class {
    func setWeatherDescription(_ text: String)
}

protocol TodayInteractorProtocol: class {
    func getWeather()
}

protocol TodayRouterProtocol: class { }
