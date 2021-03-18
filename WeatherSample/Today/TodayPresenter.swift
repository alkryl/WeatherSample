//
//  TodayPresenter.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 07/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

final class TodayPresenter {
    
    weak var view: TodayViewProtocol!
    var interactor: TodayInteractorProtocol!
    var router: TodayRouterProtocol!
    
    //MARK: Initialization
    
    required init(view: TodayViewProtocol) {
        self.view = view
    }
}

//MARK: TodayPresenterProtocol

extension TodayPresenter: TodayPresenterProtocol {
    func getWeather() {
        interactor.getWeather()
    }
    
    func configureView(with text: String) {
        view.setWeatherDescription(text)
    }
}
