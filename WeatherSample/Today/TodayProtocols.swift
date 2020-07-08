//
//  TodayProtocols.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 07/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

protocol TodayViewProtocol: AnyObject {
    var presenter: TodayPresenterProtocol! { get set }
    func setWeatherDescription(_ descr: String)
    func showView()
}

protocol TodayPresenterProtocol {
    var view: TodayViewProtocol! { get set }
    init(model: TodayModel)
    func updateView()
}
