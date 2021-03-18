//
//  GithubPresenter.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 10/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

final class GithubPresenter: GithubPresenterProtocol {
    
    weak var view: GithubViewProtocol!
    
    //MARK: Initialization
    
    init(view: GithubViewProtocol) {
        self.view = view
    }
    
    //MARK: Methods
    
    func configureView() {
        guard let url = API.githubUrl() else { return }
        view.showGithub(with: URLRequest(url: url))
    }
}
