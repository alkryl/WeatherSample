//
//  PreloadRouter.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 23.02.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

final class PreloadRouter {
    
    weak var controller: PreloadViewController!
    
    //MARK: Initialization
        
    init(controller: PreloadViewController) {
        self.controller = controller
    }
}

//MARK: PreloadRouterProtocol

extension PreloadRouter: PreloadRouterProtocol {
    func showWeather() {
        controller.performSegue(withIdentifier: K.Segue.showWeather, sender: nil)
    }
}
