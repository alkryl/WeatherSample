//
//  InfoProtocols.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 08/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

protocol InfoConfiguratorProtocol: class {
    func configure(with controller: InfoViewController)
}

protocol InfoPresenterProtocol: class {
    var router: InfoRouterProtocol! { get set }
    func getWeather()
    func tableView(heightForRowAt indexPath: PathType) -> FloatType
    func tableView(numberOfRowsInSection section: Int) -> Int
    func infoParametersForCell(at indexPath: PathType) -> InfoParameters
}

protocol InfoViewProtocol: class { }

protocol InfoInteractorProtocol: class {
    func getWeather()
    func tableView(heightForRowAt indexPath: PathType) -> FloatType
    func tableView(numberOfRowsInSection section: Int) -> Int
    func infoParametersForCell(at indexPath: PathType) -> InfoParameters
}

protocol InfoRouterProtocol: class { }
