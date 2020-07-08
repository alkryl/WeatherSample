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
            updateView()
        }
    }
    
    //MARK: Initialization
    
    required init(model: DayCellModel) {
        self.model = model
    }
    
    //MARK: Methods
    
    func updateView() {
        view.setParameters(day: model.day,
                           id: model.id,
                           dayDegree: model.dayDegree,
                           nightDegree: model.nightDegree)
    }
}
