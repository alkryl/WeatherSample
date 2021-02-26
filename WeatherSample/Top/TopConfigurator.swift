//
//  TopConfigurator.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 26.02.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

final class TopConfigurator: TopConfiguratorProtocol {
    
    func configure(with controller: TopViewController) {
        let presenter = TopPresenter(view: controller)
        let interactor = TopInteractor(presenter: presenter)
        let router = TopRouter(controller: controller)
        
        controller.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
