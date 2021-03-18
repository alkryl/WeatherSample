//
//  InfoCellViewModel.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 18.03.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

struct InfoCellViewModel {
    
    private var itemName: String
    private var itemParameter: String
    
    //MARK: Initialization
    
    init(parameters: InfoParameters) {
        itemName = parameters.name
        itemParameter = parameters.parameter
    }
}

//MARK: InfoCellViewModelProtocol

extension InfoCellViewModel: InfoCellViewModelProtocol {
    var name: String {
        return itemName
    }
    
    var parameter: String {
        return itemParameter
    }
}
