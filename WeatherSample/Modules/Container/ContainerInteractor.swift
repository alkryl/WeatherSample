//
//  ContainerInteractor.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 23.02.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

final class ContainerInteractor {
    
    weak var presenter: ContainerPresenterProtocol!
    
    //MARK: Initialization
    
    required init(presenter: ContainerPresenterProtocol) {
        self.presenter = presenter
    }
}

//MARK: ContainerInteractorProtocol

extension ContainerInteractor: ContainerInteractorProtocol {
    var shouldHighlightRows: Bool {
        return false
    }
    
    var height: FloatType {
        return K.Cell.Height.container
    }
    
    var numberOfRows: Int {
        return 1
    }
    
    func calculateHeightWith(_ constraintConstant: FloatType, offset: FloatType, barHeight: FloatType) {
        let areaHeight: FloatType = 44.0
        
        let newHeight = constraintConstant - offset
        let barHeight = areaHeight + barHeight
        
        let headerMaxHeight: FloatType = 270.0
        let headerMinHeight = areaHeight + barHeight / 4

        if newHeight > headerMaxHeight {
            presenter.updateHeader(with: headerMaxHeight, blocked: false)
        } else if newHeight < headerMinHeight {
            presenter.updateHeader(with: headerMinHeight, blocked: false)
        } else {
            presenter.updateHeader(with: newHeight, blocked: true)
        }
        
        presenter.updateAlpha((newHeight - 210.0) / 50)
    }
}
