//
//  Configurator.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 03/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

protocol ConfiguratorProtocol {
    var topPresenter: TopPresenterProtocol! { get set }
    var hoursPresenter: HoursPresenterProtocol! { get set }

    func containerPresenter(_ container: ContainerViewProtocol) -> ContainerPresenterProtocol
    func configureChildPresenters(with weather: WeatherJSON, completion: () -> ())
}

class Configurator: ConfiguratorProtocol {
        
    //MARK: Presenters
    
    var topPresenter: TopPresenterProtocol!
    var hoursPresenter: HoursPresenterProtocol!
    var daysPresenter: DaysPresenterProtocol!
    var todayPresenter: TodayPresenterProtocol!
    
    //MARK: Methods
        
    func containerPresenter(_ container: ContainerViewProtocol) -> ContainerPresenterProtocol {
        return ContainerPresenter(view: container, configurator: self)
    }
    
    func configureChildPresenters(with weather: WeatherJSON, completion: () -> ()) {
        topPresenter = TopPresenter(model: TopModel(weather))
        hoursPresenter = HoursPresenter(model: HoursModel(weather))
        daysPresenter = DaysPresenter(model: DaysModel(weather))
        todayPresenter = TodayPresenter(model: TodayModel(weather))
        
        completion()
    }
}
