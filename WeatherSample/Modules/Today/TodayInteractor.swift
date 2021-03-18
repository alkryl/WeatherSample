//
//  TodayInteractor.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 22.02.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

final class TodayInteractor {
    
    weak var presenter: TodayPresenterProtocol!
    
    //MARK: Properties
    
    private var modelLayer: TodayModelLayer!
    
    //MARK: Services
    
    private var cacheServiceProvider: CacheServiceProviderProtocol! = CacheServiceProvider()
    
    //MARK: Initialization
    
    required init(presenter: TodayPresenterProtocol) {
        self.presenter = presenter
    }
}

//MARK: TodayInteractorProtocol

extension TodayInteractor: TodayInteractorProtocol {
    func getWeather() {
        guard let json = cacheServiceProvider.getWeather() else {
            return
        }
        modelLayer = TodayModelLayer(TodayModel(json))
        presenter.configureView(with: modelLayer.weatherInfo)
    }
}
