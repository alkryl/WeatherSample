//
//  GithubPresenter.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 10/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

class GithubPresenter: GithubPresenterProtocol {
    
    unowned var view: GithubViewProtocol! {
        didSet {
            updateView()
        }
    }
    private var url: URL?
    
    //MARK: Initialization
    
    required init(url: URL?) {
        self.url = url
    }
    
    //MARK: Methods
    
    func updateView() {
        guard let url = url else { return }
        view.showGithub(with: URLRequest(url: url))
    }
}
