//
//  DaysPresenter.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 07/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

final class DaysPresenter {
    
    weak var view: DaysViewProtocol!
    var interactor: DaysInteractorProtocol!
    var router: DaysRouterProtocol!
    
    //MARK: Initialization
    
    required init(view: DaysViewProtocol) {
        self.view = view
    }
}

//MARK: DaysPresenterProtocol

extension DaysPresenter: DaysPresenterProtocol {
    func getWeather() {
        interactor.getWeather()
    }
    
    func tableView(heightForRowAt indexPath: PathType) -> FloatType {
        return interactor.tableView(heightForRowAt: indexPath)
    }
    
    func tableView(numberOfRowsInSection section: Int) -> Int {
        return interactor.tableView(numberOfRowsInSection: section)
    }
    
    func dayParametersForCell(at indexPath: PathType) -> DayParameters {
        return interactor.dayParametersForCell(at: indexPath)
    }
}
