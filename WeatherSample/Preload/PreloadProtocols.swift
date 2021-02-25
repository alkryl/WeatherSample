//
//  PreloadProtocols.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 23.02.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

protocol PreloadConfiguratorProtocol: class {
    func configure(with controller: PreloadViewController)
}

protocol PreloadPresenterProtocol: class {
    var router: PreloadRouterProtocol! { get set }
    func getWeather()
    func showWeather()
    func showError(_ description: String)
}

protocol PreloadViewProtocol: class {
    func showError(_ description: String)
}

protocol PreloadInteractorProtocol: class {
    func getWeather()
}

protocol PreloadRouterProtocol: class {
    func showWeather()
}
