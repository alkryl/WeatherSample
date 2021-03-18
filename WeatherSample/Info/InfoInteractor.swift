//
//  InfoInteractor.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 18.03.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

final class InfoInteractor {
    
    weak var presenter: InfoPresenterProtocol!
    
    //MARK: Properties
    
    private var modelLayer: InfoModelLayer!
    
    //MARK: Services
    
    private var cacheServiceProvider: CacheServiceProviderProtocol! = CacheServiceProvider()
    
    //MARK: Initialization
    
    required init(presenter: InfoPresenterProtocol) {
        self.presenter = presenter
    }
}

//MARK: InfoInteractorProtocol

extension InfoInteractor: InfoInteractorProtocol {
    func getWeather() {
        guard let json = cacheServiceProvider.getWeather() else {
            return
        }
        modelLayer = InfoModelLayer(InfoModel(json))
    }
    
    func tableView(heightForRowAt indexPath: PathType) -> FloatType {
        return K.Cell.Height.info
    }
    
    func tableView(numberOfRowsInSection section: Int) -> Int {
        return modelLayer.weatherInfo.count
    }
    
    func infoParametersForCell(at indexPath: PathType) -> InfoParameters {
        let info = modelLayer.weatherInfo[indexPath.row]
        return (info.name, info.parameter)
    }
}
