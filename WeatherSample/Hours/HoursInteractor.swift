//
//  HoursInteractor.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 05.03.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

final class HoursInteractor {
    
    weak var presenter: HoursPresenterProtocol!
    
    //MARK: Properties
    
    private var modelLayer: HoursModelLayer!
    
    //MARK: Services
    
    private var cacheServiceProvider: CacheServiceProviderProtocol! = CacheServiceProvider()
    
    //MARK: Initialization
    
    required init(presenter: HoursPresenterProtocol) {
        self.presenter = presenter
    }
}

//MARK: HoursInteractorProtocol

extension HoursInteractor: HoursInteractorProtocol {
    func getWeather() {
        guard let json = cacheServiceProvider.getWeather() else {
            return
        }
        modelLayer = HoursModelLayer(HoursModel(json))
    }
    
    func collectionView(numberOfItemsInSection section: Int) -> Int {
        return modelLayer.weatherForecast.count
    }
    
    func collectionView(sizeForItemAt indexPath: PathType) -> SizeType {
        return SizeType(width: 60, height: 100)
    }
    
    func hourParametersForCell(at indexPath: PathType) -> HourParameters {
        let item = modelLayer.weatherForecast[indexPath.row]
        return (item.weatherCode, item.hour, item.temperature)
    }
}
