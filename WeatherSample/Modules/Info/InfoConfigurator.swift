//
//  InfoConfigurator.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 18.03.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

final class InfoConfigurator: InfoConfiguratorProtocol {
        
    func configure(with controller: InfoViewController) {
        let presenter = InfoPresenter(view: controller)
        let interactor = InfoInteractor(presenter: presenter)
        let router = InfoRouter(controller: controller)
        
        controller.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
