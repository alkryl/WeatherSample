//
//  TopRouter.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 26.02.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

final class TopRouter: TopRouterProtocol {
    
    weak var controller: TopViewController!
    
    //MARK: Initialization
        
    init(controller: TopViewController) {
        self.controller = controller
    }
}
