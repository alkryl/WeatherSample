//
//  ContainerRouter.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 23.02.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

final class ContainerRouter: ContainerRouterProtocol {
    
    weak var controller: ContainerViewController!
    
    //MARK: Initialization
        
    init(controller: ContainerViewController) {
        self.controller = controller
    }
}
