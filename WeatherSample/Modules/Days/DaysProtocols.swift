//
//  DaysProtocols.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 07/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

protocol DaysConfiguratorProtocol: class {
    func configure(with controller: DaysViewController)
}

protocol DaysPresenterProtocol: class {
    var router: DaysRouterProtocol! { get set }
    func getWeather()
    func tableView(heightForRowAt indexPath: PathType) -> FloatType
    func tableView(numberOfRowsInSection section: Int) -> Int
    func dayParametersForCell(at indexPath: PathType) -> DayParameters
}

protocol DaysViewProtocol: class { }

protocol DaysInteractorProtocol: class {
    func getWeather()
    func tableView(heightForRowAt indexPath: PathType) -> FloatType
    func tableView(numberOfRowsInSection section: Int) -> Int
    func dayParametersForCell(at indexPath: PathType) -> DayParameters
}

protocol DaysRouterProtocol: class { }
