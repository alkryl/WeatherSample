//
//  DayCellPresenter.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 07/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

class DayCellPresenter: DayCellPresenterProtocol {
    
    private var model: DayCellModel!
    
    unowned var view: DayCellProtocol! {
        didSet {
            configureView(with: model)
        }
    }
    
    required init(model: DayCellModel) {
        self.model = model
    }
    
    func configureView(with model: DayCellModel) {
        view.setParameters(day: model.day,
                           id: model.id,
                           dayDegree: model.dayDegree,
                           nightDegree: model.nightDegree)
    }
}
