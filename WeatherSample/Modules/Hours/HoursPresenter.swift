//
//  HoursPresenter.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 05/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

final class HoursPresenter {
    
    weak var view: HoursViewProtocol!
    var interactor: HoursInteractorProtocol!
    var router: HoursRouterProtocol!
    
    //MARK: Initialization
    
    required init(view: HoursViewProtocol) {
        self.view = view
    }
}

//MARK: HoursPresenterProtocol

extension HoursPresenter: HoursPresenterProtocol {
    func getWeather() {
        interactor.getWeather()
    }
    
    func collectionView(numberOfItemsInSection section: Int) -> Int {
        return interactor.collectionView(numberOfItemsInSection: section)
    }
    
    func collectionView(sizeForItemAt indexPath: PathType) -> SizeType {
        return interactor.collectionView(sizeForItemAt: indexPath)
    }
    
    func hourParametersForCell(at indexPath: PathType) -> HourParameters {
        return interactor.hourParametersForCell(at: indexPath)
    }
}
