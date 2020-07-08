//
//  HoursPresenter.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 05/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

class HoursPresenter: HoursPresenterProtocol {
    
    private var model: HoursModel!
    
    unowned var view: HoursViewProtocol! {
        didSet {
            updateView()
        }
    }
    
    //MARK: Initialization
    
    required init(model: HoursModel) {
        self.model = model
    }
        
    //MARK: Methods
    
    func updateView() {
        view.updateDisplayedData(HoursWeather(model).hoursForecast)
        view.updateView()
    }
    
    func cellPresenter(for row: Int) -> HourCellPresenterProtocol {
        let data = HoursWeather(model).hoursForecast[row]
        return HourCellPresenter(model: HourCellModel(hour: data.hour,
                                                      temp: data.temp,
                                                      id: data.id))
    }
}
