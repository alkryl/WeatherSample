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
    func showGithub(with: URLRequest)
}

protocol GithubPresenterProtocol {
    var view: GithubViewProtocol! { get set }
    func configureView()
}
