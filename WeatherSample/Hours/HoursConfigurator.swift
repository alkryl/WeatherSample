//
//  HoursConfigurator.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 26.02.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

final class HoursConfigurator: HoursConfiguratorProtocol {
    
    func configure(with controller: HoursViewController) {
        let presenter = HoursPresenter(view: controller)
        let interactor = HoursInteractor(presenter: presenter)
        let router = HoursRouter(controller: controller)
        
        controller.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
