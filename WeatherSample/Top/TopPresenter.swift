//
//  TopPresenter.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 02/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

class TopPresenter: TopPresenterProtocol {
    
    private var model: TopModel!
    
    unowned var view: TopViewProtocol! {
        didSet {
            configureView(with: model)
        }
    }
        
    //MARK: Initialization
    
    required init(model: TopModel) {
        self.model = model
    }
    
    //MARK: Methods
    
    func configureView(with model: TopModel) {
        self.view.setParameters(city: model.city,
                                weather: model.weather,
                                degree: model.degree,
                                day: model.dayOfWeek,
                                dayTime: model.dayTime,
                                maxDegree: model.maxDegree,
                                minDegree: model.minDegree)
    }
}
