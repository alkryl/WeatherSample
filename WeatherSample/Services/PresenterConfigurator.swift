//
//  PresenterConfigurator.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 16/08/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import UIKit

class PresenterConfigurator {
    
    //MARK: Child presenters
    
    var topPresenter:    TopPresenterProtocol!
    var hoursPresenter:  HoursPresenterProtocol!
    var daysPresenter:   DaysPresenterProtocol!
    var todayPresenter:  TodayPresenterProtocol!
    var infoPresenter:   InfoPresenterProtocol!
    var bottomPresenter: BottomPresenterProtocol!
    
    //MARK: Methods
    
    func configureChildPresenters(with weather: WeatherJSON,
                                          completion: () -> ()) {
        topPresenter    = TopPresenter(model: TopModel(weather))
        hoursPresenter  = HoursPresenter(model: HoursModel(weather))
        daysPresenter   = DaysPresenter(model: DaysModel(weather))
        todayPresenter  = TodayPresenter(model: TodayModel(weather))
        infoPresenter   = InfoPresenter(model: InfoModel(weather))
        bottomPresenter = BottomPresenter()
        completion()
    }
    
    func setChildPresenter(for view: AnyObject) {
        if let view = view as? TopViewProtocol {
            view.presenter = topPresenter
            topPresenter.view = view
        } else if let view = view as? HoursViewProtocol {
            view.presenter = hoursPresenter
            hoursPresenter.view = view
        } else if let view = view as? DaysViewProtocol {
            view.presenter = daysPresenter
            daysPresenter.view = view
        } else if let view = view as? TodayViewProtocol {
            view.presenter = todayPresenter
            todayPresenter.view = view
        } else if let view = view as? InfoViewProtocol {
            view.presenter = infoPresenter
            infoPresenter.view = view
        } else if let view = view as? BottomViewProtocol {
            view.presenter = bottomPresenter
            bottomPresenter.view = view
        }
    }
}
