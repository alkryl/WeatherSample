//
//  PreloadPresenter.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 23.02.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

final class PreloadPresenter {
    
    weak var view: PreloadViewProtocol!
    var interactor: PreloadInteractorProtocol!
    var router: PreloadRouterProtocol!
    
    //MARK: Initialization
    
    required init(view: PreloadViewProtocol) {
        self.view = view
    }
}

//MARK: PreloadPresenterProtocol

extension PreloadPresenter: PreloadPresenterProtocol {
    func getWeather() {
        interactor.getWeather()
    }
    
    func showWeather() {
        router.showWeather()
    }
    
    func showError(_ description: String) {
        view.showError(description)
    }
}
