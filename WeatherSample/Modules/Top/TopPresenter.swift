//
//  TopPresenter.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 02/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

final class TopPresenter {
    
    weak var view: TopViewProtocol!
    var interactor: TopInteractorProtocol!
    var router: TopRouterProtocol!
    
    //MARK: Initialization
    
    required init(view: TopViewProtocol) {
        self.view = view
    }
}

//MARK: TopPresenterProtocol

extension TopPresenter: TopPresenterProtocol {
    func getWeather() {
        interactor.getWeather()
    }
    
    func configureView() {
        view.configureView()
    }
    
    func getText(for tag: Int) -> String {
        return interactor.getText(for: tag)
    }
    
    func shouldChangeAlpha(for tag: Int) -> Bool {
        return interactor.shouldChangeAlpha(for: tag)
    }
}
