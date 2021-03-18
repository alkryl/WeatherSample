//
//  BottomProtocols.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 20/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

protocol BottomConfiguratorProtocol: class {
    func configure(with controller: BottomViewController)
}

protocol BottomPresenterProtocol: class {
    var router: BottomRouterProtocol! { get set }
    func githubButtonClicked()
}

protocol BottomViewProtocol: class { }

protocol BottomInteractorProtocol: class { }

protocol BottomRouterProtocol: class {
    func showGithub()
}
