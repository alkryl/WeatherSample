//
//  TopPresenter.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 02/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

class TopPresenter: TopPresenterProtocol {
    
    private var displayedData: TopViewData!
    
    unowned var view: TopViewProtocol! {
        didSet {
            updateView()
        }
    }
        
    //MARK: Initialization
    
    required init(model: TopModel) {
        displayedData = TopViewData(model)
    }
    
    //MARK: Methods
    
    func updateView() {
        view.setParameters(city: displayedData.city,
                           weather: displayedData.weather,
                           degree: displayedData.degree,
                           day: displayedData.dayOfWeek,
                           dayTime: displayedData.dayTime,
                           maxDegree: displayedData.maxDegree,
                           minDegree: displayedData.minDegree)
        view.showView()
    }
}
