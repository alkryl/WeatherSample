//
//  InfoPresenter.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 08/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

final class InfoPresenter {
    
    weak var view: InfoViewProtocol!
    var interactor: InfoInteractorProtocol!
    var router: InfoRouterProtocol!
    
    //MARK: Initialization
    
    required init(view: InfoViewProtocol) {
        self.view = view
    }
}

//MARK: InfoPresenterProtocol

extension InfoPresenter: InfoPresenterProtocol {
    func getWeather() {
        interactor.getWeather()
    }
    
    func tableView(heightForRowAt indexPath: PathType) -> FloatType {
        return interactor.tableView(heightForRowAt: indexPath)
    }
    
    func tableView(numberOfRowsInSection section: Int) -> Int {
        return interactor.tableView(numberOfRowsInSection: section)
    }
    
    func infoParametersForCell(at indexPath: PathType) -> InfoParameters {
        return interactor.infoParametersForCell(at: indexPath)
    }
}
