//
//  DayCellProtocols.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 07/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

protocol DayCellProtocol: AnyObject {
    var presenter: DayCellPresenterProtocol! { get set }
    func setParameters(day: String, id: Int, dayDegree: String, nightDegree: String)
}

protocol DayCellPresenterProtocol {
    var view: DayCellProtocol! { get set }
    init(model: DayCellModel)
    func configureView(with model: DayCellModel)
}
