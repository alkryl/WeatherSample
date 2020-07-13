//
//  GithubProtocols.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 10/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

protocol GithubViewProtocol: AnyObject {
    var presenter: GithubPresenterProtocol! { get set }
    func showGithub(with request: URLRequest)
}

protocol GithubPresenterProtocol {
    var view: GithubViewProtocol! { get set }
    init(url: URL?)
    func updateView()
}
