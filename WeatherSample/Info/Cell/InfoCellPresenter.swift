//
//  InfoCellPresenter.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 08/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

class InfoCellPresenter: InfoCellPresenterProtocol {
    
    private var model: InfoCellModel!
    
    unowned var view: InfoCellProtocol! {
        didSet {
            updateView()
        }
    }
    
    //MARK: Initialization
    
    required init(model: InfoCellModel) {
        self.model = model
    }
    
    //MARK: Methods
    
    func updateView() {
        view.setParameters(name: model.name, parameter: model.parameter)
    }
}
