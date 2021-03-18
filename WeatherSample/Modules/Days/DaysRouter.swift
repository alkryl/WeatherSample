//
//  DaysRouter.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 15.03.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

final class DaysRouter: DaysRouterProtocol {
    
    weak var controller: DaysViewController!
    
    //MARK: Initialization
        
    init(controller: DaysViewController) {
        self.controller = controller
    }
}
