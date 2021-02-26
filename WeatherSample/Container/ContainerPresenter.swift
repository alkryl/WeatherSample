//
//  ContainerPresenter.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 02/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

final class ContainerPresenter {
    
    weak var view: ContainerViewProtocol!
    var interactor: ContainerInteractorProtocol!
    var router: ContainerRouterProtocol!
    
    //MARK: Initialization
    
    required init(view: ContainerViewProtocol) {
        self.view = view
    }
}

//MARK: ContainerPresenterProtocol

extension ContainerPresenter: ContainerPresenterProtocol {
    func tableView(shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return interactor.shouldHighlightRows
    }
    
    func tableView(heightForRowAt indexPath: IndexPath) -> FloatType {
        return interactor.height
    }
    
    func tableView(numberOfRowsInSection section: Int) -> Int {
        return interactor.numberOfRows
    }
    
    func calculateHeightWith(_ constraintConstant: FloatType, offset: FloatType, barHeight: FloatType) {
        interactor.calculateHeightWith(constraintConstant, offset: offset, barHeight: barHeight)
    }
    
    func updateHeader(with height: FloatType, blocked: Bool) {
        view.updateHeader(with: height, blocked: blocked)
    }
}
