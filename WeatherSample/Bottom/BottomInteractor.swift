//
//  BottomInteractor.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 18.03.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

final class BottomInteractor {
    
    weak var presenter: BottomPresenterProtocol!
    
    //MARK: Initialization
    
    required init(presenter: BottomPresenterProtocol) {
        self.presenter = presenter
    }
}

//MARK: BottomInteractorProtocol

extension BottomInteractor: BottomInteractorProtocol { }
