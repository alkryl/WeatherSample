//
//  ContainerProtocols.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 02/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

protocol ContainerConfiguratorProtocol: class {
    func configure(with controller: ContainerViewController)
}

protocol ContainerPresenterProtocol: class {
    var router: ContainerRouterProtocol! { get set }
    func tableView(shouldHighlightRowAt indexPath: IndexPath) -> Bool
    func tableView(heightForRowAt indexPath: IndexPath) -> FloatType
    func tableView(numberOfRowsInSection section: Int) -> Int
    func calculateHeightWith(_ constraintConstant: FloatType, offset: FloatType, barHeight: FloatType)
    func updateHeader(with height: FloatType, blocked: Bool)
    func updateAlpha(_ value: FloatType)
}

protocol ContainerViewProtocol: class {
    func updateHeader(with height: FloatType, blocked: Bool)
    func updateAlpha(_ value: FloatType)
}

protocol ContainerInteractorProtocol: class {
    var shouldHighlightRows: Bool { get }
    var height: FloatType { get }
    var numberOfRows: Int { get }
    func calculateHeightWith(_ constraintConstant: FloatType, offset: FloatType, barHeight: FloatType)
}

protocol ContainerRouterProtocol: class { }
