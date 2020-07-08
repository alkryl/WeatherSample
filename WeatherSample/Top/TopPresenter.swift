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
            updateView()
        }
    }
        
    //MARK: Initialization
    
    required init(model: TopModel) {
        self.model = model
    }
    
    //MARK: Methods
    
    func updateView() {
        let topViewData = TopViewData(model)
        view.setParameters(city: topViewData.city,
                           weather: topViewData.weather,
                           degree: topViewData.degree,
                           day: topViewData.dayOfWeek,
                           dayTime: topViewData.dayTime,
                           maxDegree: topViewData.maxDegree,
                           minDegree: topViewData.minDegree)
        view.showView()
    }
}
