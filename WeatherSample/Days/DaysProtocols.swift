//
//  DaysProtocols.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 07/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

protocol DaysViewProtocol: AnyObject {
    var presenter: DaysPresenterProtocol! { get set }
    func updateDisplayedData(_ data: [DaysViewData])
    func updateView()
}

protocol DaysPresenterProtocol {
    var view: DaysViewProtocol! { get set }
    init(model: DaysModel)
    func cellPresenter(for row: Int) -> DayCellPresenterProtocol
    func updateView()
}
