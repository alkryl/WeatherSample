//
//  DaysInteractor.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 15.03.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

final class DaysInteractor {
    
    weak var presenter: DaysPresenterProtocol!
    
    //MARK: Properties
    
    private var modelLayer: DaysModelLayer!
    
    //MARK: Services
    
    private var cacheServiceProvider: CacheServiceProviderProtocol! = CacheServiceProvider()
    
    //MARK: Initialization
    
    required init(presenter: DaysPresenterProtocol) {
        self.presenter = presenter
    }
}

//MARK: DaysInteractorProtocol

extension DaysInteractor: DaysInteractorProtocol {
    func getWeather() {
        guard let json = cacheServiceProvider.getWeather() else {
            return
        }
        modelLayer = DaysModelLayer(DaysModel(json))
    }
    
    func tableView(heightForRowAt indexPath: PathType) -> FloatType {
        return K.Cell.Height.day
    }
    
    func tableView(numberOfRowsInSection section: Int) -> Int {
        return modelLayer.weatherForecast.count
    }
    
    func dayParametersForCell(at indexPath: PathType) -> DayParameters {
        let item = modelLayer.weatherForecast[indexPath.row]
        return (item.day, item.id, item.dayDegree, item.nightDegree)
    }
}
