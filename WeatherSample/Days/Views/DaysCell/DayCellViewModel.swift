//
//  DayCellViewModel.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 15.03.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

struct DayCellViewModel {
    
    private var itemDay: String?
    private var itemId: Int?
    private var itemDayTemperature: String?
    private var itemNightTemperature: String?
    
    //MARK: Initialization
    
    init(parameters: DayParameters) {
        itemDay = parameters.day
        itemId = parameters.id
        itemDayTemperature = parameters.dayTemperature
        itemNightTemperature = parameters.nightTemperature
    }
}

//MARK: DayCellViewModelProtocol

extension DayCellViewModel: DayCellViewModelProtocol {
    var day: String {
        return itemDay.orEmpty
    }
    
    var id: Int {
        return itemId.orEmpty
    }
    
    var dayTemperature: String {
        return itemDayTemperature.orEmpty
    }
    
    var nightTemperature: String {
        return itemNightTemperature.orEmpty
    }
}
