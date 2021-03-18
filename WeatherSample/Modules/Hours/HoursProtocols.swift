//
//  HoursProtocols.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 05/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

protocol HoursConfiguratorProtocol: class {
    func configure(with controller: HoursViewController)
}

protocol HoursPresenterProtocol: class {
    var router: HoursRouterProtocol! { get set }
    func getWeather()
    func collectionView(numberOfItemsInSection section: Int) -> Int
    func collectionView(sizeForItemAt indexPath: PathType) -> SizeType
    func hourParametersForCell(at indexPath: PathType) -> HourParameters
}

protocol HoursViewProtocol: class { }

protocol HoursInteractorProtocol: class {
    func getWeather()
    func collectionView(numberOfItemsInSection section: Int) -> Int
    func collectionView(sizeForItemAt indexPath: PathType) -> SizeType
    func hourParametersForCell(at indexPath: PathType) -> HourParameters
}

protocol HoursRouterProtocol: class { }
