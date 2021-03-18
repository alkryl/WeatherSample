//
//  TopInteractor.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 26.02.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

final class TopInteractor {
    
    weak var presenter: TopPresenterProtocol!
    
    //MARK: Properties
    
    private var modelLayer: TopModelLayer!
    
    //MARK: Services
    
    private var cacheServiceProvider: CacheServiceProviderProtocol! = CacheServiceProvider()
    
    //MARK: Initialization
    
    required init(presenter: TopPresenterProtocol) {
        self.presenter = presenter
    }
}

//MARK: TopInteractorProtocol

extension TopInteractor: TopInteractorProtocol {
    enum Tag: Int {
        case city = 0, weather, degree, day, today, maxDegree, minDegree
    }
    
    func getWeather() {
        guard let json = cacheServiceProvider.getWeather() else {
            return
        }
        modelLayer = TopModelLayer(TopModel(json))
        presenter.configureView()
    }
    
    func getText(for tag: Int) -> String {
        switch Tag(rawValue: tag) {
        case .city:      return modelLayer.city
        case .weather:   return modelLayer.weather
        case .degree:    return modelLayer.degree
        case .day:       return modelLayer.dayOfWeek
        case .today:     return modelLayer.dayTime
        case .maxDegree: return modelLayer.maxDegree
        case .minDegree: return modelLayer.minDegree
        default: return .empty
        }
    }
    
    func shouldChangeAlpha(for tag: Int) -> Bool {
        switch Tag(rawValue: tag) {
        case .degree, .day, .today, .maxDegree, .minDegree:
            return true
        default:
            return false
        }
    }
}
