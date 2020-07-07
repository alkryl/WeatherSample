//
//  HourCellPresenter.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 07/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

class HourCellPresenter: HourCellPresenterProtocol {
    
    private var model: HourCellModel!
    
    unowned var view: HourCellProtocol! {
        didSet {
            configureView(with: model)
        }
    }
    
    //MARK: Initialization
    
    required init(model: HourCellModel) {
        self.model = model
    }
    
    //MARK: Methods
    
    func configureView(with model: HourCellModel) {
        view.setParameters(hour: model.hour, temp: model.temp, id: model.id)
        
        if model.hour == "Now" {
            view.updateUI()
        }
    }
}


