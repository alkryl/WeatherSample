//
//  HourCellProtocols.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 07/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

protocol HourCellProtocol: AnyObject {
    var presenter: HourCellPresenterProtocol! { get set }
    func setParameters(hour: String, temp: String, id: Int)
    func updateUI()
}

protocol HourCellPresenterProtocol {
    var view: HourCellProtocol! { get set }
    init(model: HourCellModel)
    func configureView(with model: HourCellModel)
}
