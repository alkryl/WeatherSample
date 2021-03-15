//
//  HoursRouter.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 05.03.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

final class HoursRouter: HoursRouterProtocol {
    
    weak var controller: HoursViewController!
    
    //MARK: Initialization
        
    init(controller: HoursViewController) {
        self.controller = controller
    }
}
