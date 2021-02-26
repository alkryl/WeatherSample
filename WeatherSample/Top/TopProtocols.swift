//
//  TopProtocols.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 02/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

protocol TopConfiguratorProtocol: class {
    func configure(with controller: TopViewController)
}

protocol TopPresenterProtocol: class {
    var router: TopRouterProtocol! { get set }
    func getWeather()
    func configureView()
    func getText(for tag: Int) -> String
    func shouldChangeAlpha(for tag: Int) -> Bool
}

protocol TopViewProtocol: class {
    func configureView()
    func updateAlpha(_ value: FloatType)
}

protocol TopInteractorProtocol: class {
    func getWeather()
    func getText(for tag: Int) -> String
    func shouldChangeAlpha(for tag: Int) -> Bool
}

protocol TopRouterProtocol: class { }
