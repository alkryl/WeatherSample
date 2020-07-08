//
//  TodayPresenter.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 07/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

class TodayPresenter: TodayPresenterProtocol {
    
    private var model: TodayModel!
    
    unowned var view: TodayViewProtocol! {
        didSet {
            updateView()
        }
    }
    
    //MARK: Initialization
    
    required init(model: TodayModel) {
        self.model = model
    }
    
    func updateView() {
        view.setWeatherDescription(TodayViewData(model).weatherDescription)
        view.showView()
    }
}
