//
//  PreloadConfigurator.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 23.02.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

class PreloadConfigurator: PreloadConfiguratorProtocol {
    
    func configure(with controller: PreloadViewController) {
        let presenter = PreloadPresenter(view: controller)
        let interactor = PreloadInteractor(presenter: presenter)
        let router = PreloadRouter(controller: controller)
        
        controller.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
