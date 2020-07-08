//
//  TodayPresenter.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 07/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

class TodayPresenter: TodayPresenterProtocol {
    
    var displayedData: TodayViewData!
    
    unowned var view: TodayViewProtocol! {
        didSet {
            updateView()
        }
    }
    
    //MARK: Initialization
    
    required init(model: TodayModel) {
        displayedData = TodayViewData(model)
    }
    
    func updateView() {
        view.setWeatherDescription(displayedData.weatherDescription)
        view.showView()
    }
}
