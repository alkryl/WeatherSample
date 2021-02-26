//
//  ContainerConfigurator.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 23.02.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

class ContainerConfigurator: ContainerConfiguratorProtocol {
    
    func configure(with controller: ContainerViewController) {
        let presenter = ContainerPresenter(view: controller)
        let interactor = ContainerInteractor(presenter: presenter)
        let router = ContainerRouter(controller: controller)
        
        controller.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
