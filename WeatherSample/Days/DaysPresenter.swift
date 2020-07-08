//
//  DaysPresenter.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 07/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

private let kNumberOfRows = 7

class DaysPresenter: DaysPresenterProtocol {
    
    private var model: DaysModel!
    
    unowned var view: DaysViewProtocol! {
        didSet {
            updateView()
        }
    }
    
    //MARK: Initialization
    
    required init(model: DaysModel) {
        self.model = model
    }
    
    //MARK: Methods
    
    func updateView() {
        view.updateDisplayedData(DaysWeather(model).daysForecast)
        view.updateView()
    }
    
    func cellPresenter(for row: Int) -> DayCellPresenterProtocol {
        let data = DaysWeather(model).daysForecast[row]
        return DayCellPresenter(model: DayCellModel(day: data.day,
                                                    id: data.id,
                                                    dayDegree: data.dayDegree,
                                                    nightDegree: data.nightDegree))
    }
}
