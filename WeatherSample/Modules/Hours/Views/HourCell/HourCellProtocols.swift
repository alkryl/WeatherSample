//
//  HourCellProtocols.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 07/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

protocol HourCellViewModelProtocol {
    var id: Int { get }
    var time: String { get }
    var temperature: String { get }
    var styleEvent: Bool { get }
}
