//
//  BottomConfigurator.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 18.03.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

final class BottomConfigurator: BottomConfiguratorProtocol {
        
    func configure(with controller: BottomViewController) {
        let presenter = BottomPresenter(view: controller)
        let interactor = BottomInteractor(presenter: presenter)
        let router = BottomRouter(controller: controller)
        
        controller.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
