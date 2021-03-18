//
//  BottomPresenter.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 20/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

final class BottomPresenter {
    
    weak var view: BottomViewProtocol!
    var interactor: BottomInteractorProtocol!
    var router: BottomRouterProtocol!
    
    //MARK: Initialization
    
    required init(view: BottomViewProtocol) {
        self.view = view
    }
}

//MARK: BottomPresenterProtocol

extension BottomPresenter: BottomPresenterProtocol {
    func githubButtonClicked() {
        router.showGithub()
    }
}
