//
//  DayCellProtocols.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 07/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

protocol DayCellViewModelProtocol {
    var day: String { get }
    var id: Int { get }
    var dayTemperature: String { get }
    var nightTemperature: String { get }
}
