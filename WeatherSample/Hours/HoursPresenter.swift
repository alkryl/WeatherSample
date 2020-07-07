//
//  HoursPresenter.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 05/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

private let kNumberOfRows = 26

class HoursPresenter: HoursPresenterProtocol {
    
    private var model: HoursModel!
    
    unowned var view: HoursViewProtocol! {
        didSet {
            configureView(with: model)
        }
    }
    
    //MARK: Initialization
    
    required init(model: HoursModel) {
        self.model = model
    }
        
    //MARK: Methods
    
    func configureView(with model: HoursModel) {
        view.updateUI()
    }
    
    func dataFor(row: Int) -> HoursWeather {
        return model.hoursWeather[row]
    }
    
    func numberOfRows() -> Int {
        return kNumberOfRows
    }
}
