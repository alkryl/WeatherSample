//
//  HourCellViewModel.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 14.03.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

struct HourCellViewModel {
    
    private var itemId: Int?
    private var itemTime: String?
    private var itemTemperature: String?
    
    //MARK: Initialization
    
    init(parameters: HourParameters) {
        itemId = parameters.id
        itemTime = parameters.time
        itemTemperature = parameters.temperature
    }
}

//MARK: HourCellViewModelProtocol

extension HourCellViewModel: HourCellViewModelProtocol {
    var id: Int {
        return itemId.orEmpty
    }
    
    var time: String {
        return itemTime.orEmpty
    }
    
    var temperature: String {
        return itemTemperature.orEmpty
    }
    
    var styleEvent: Bool {
        return time == K.Weather.Text.now
    }
}
