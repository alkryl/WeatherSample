//
//  DaysConfigurator.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 15.03.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

final class DaysConfigurator: DaysConfiguratorProtocol {
    
    func configure(with controller: DaysViewController) {
        let presenter = DaysPresenter(view: controller)
        let interactor = DaysInteractor(presenter: presenter)
        let router = DaysRouter(controller: controller)
        
        controller.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
