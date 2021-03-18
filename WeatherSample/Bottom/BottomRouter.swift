//
//  BottomRouter.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 18.03.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

final class BottomRouter {
    
    weak var controller: BottomViewController!
    
    //MARK: Initialization
        
    init(controller: BottomViewController) {
        self.controller = controller
    }
}

//MARK: BottomRouterProtocol

extension BottomRouter: BottomRouterProtocol {
    func showGithub() {
        controller.performSegue(withIdentifier: K.Segue.showGithub, sender: nil)
    }
}
