//
//  TodayConfigurator.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 22.02.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

final class TodayConfigurator: TodayConfiguratorProtocol {
        
    func configure(with controller: TodayViewController) {
        let presenter = TodayPresenter(view: controller)
        let interactor = TodayInteractor(presenter: presenter)
        let router = TodayRouter(controller: controller)
        
        controller.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
