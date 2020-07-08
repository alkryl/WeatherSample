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
            updateView()
        }
    }
    
    //MARK: Initialization
    
    required init(model: HourCellModel) {
        self.model = model
    }
    
    //MARK: Methods
    
    func updateView() {
        view.setParameters(hour: model.hour, temp: model.temp, id: model.id)
        
        if needToUpdateView(model) {
            view.updateView()
        }
    }
    
    //MARK: Private
    
    private func needToUpdateView(_ model: HourCellModel) -> Bool {
        return model.hour == "Now"
    }
}


