//
//  InfoRouter.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 18.03.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

final class InfoRouter: InfoRouterProtocol {
    
    weak var controller: InfoViewController!
    
    //MARK: Initialization
        
    init(controller: InfoViewController) {
        self.controller = controller
    }
}
