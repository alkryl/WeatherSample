//
//  InfoCellProtocols.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 08/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

protocol InfoCellProtocol: AnyObject {
    var presenter: InfoCellPresenterProtocol! { get set }
    func setParameters(name: String, parameter: String)
}

protocol InfoCellPresenterProtocol {
    var view: InfoCellProtocol! { get set }
    init(model: InfoCellModel)
    func updateView()
}
