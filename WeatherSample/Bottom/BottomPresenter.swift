//
//  BottomPresenter.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 20/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

class BottomPresenter: BottomPresenterProtocol {
    
    unowned var view: BottomViewProtocol!
    
    //MARK: Methods
    
    func setPresenter(for view: GithubViewProtocol) {
        let gitPresenter = GithubPresenter(url: API().githubUrl())
        self.view.showGithubPage(view: view)
        view.presenter = gitPresenter
        gitPresenter.view = view
    }
}
