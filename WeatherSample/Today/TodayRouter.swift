//
//  TodayRouter.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 22.02.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

final class TodayRouter: TodayRouterProtocol {
    
    weak var controller: TodayViewController!
    
    //MARK: Initialization
        
    init(controller: TodayViewController) {
        self.controller = controller
    }
}
