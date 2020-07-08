//
//  HoursProtocols.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 05/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import UIKit

protocol HoursViewProtocol: AnyObject {
    var presenter: HoursPresenterProtocol! { get set }
    func updateDisplayedData(_ data: [HoursViewData])
    func updateView()
}

protocol HoursPresenterProtocol {
    var view: HoursViewProtocol! { get set }
    init(model: HoursModel)
    func cellPresenter(for row: Int) -> HourCellPresenterProtocol
    func updateView()
}
