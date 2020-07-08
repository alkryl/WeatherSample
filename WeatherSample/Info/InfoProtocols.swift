//
//  InfoProtocols.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 08/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

protocol InfoViewProtocol: AnyObject {
    var presenter: InfoPresenterProtocol! { get set }
    func updateDisplayedData(_ data: InfoData)
    func updateView()
}

protocol InfoPresenterProtocol {
    var view: InfoViewProtocol! { get set }
    init(model: InfoModel)
    func updateView()
    func setPresenter(for cell: InfoCellProtocol, at row: Int)
}
