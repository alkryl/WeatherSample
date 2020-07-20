//
//  BottomProtocols.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 20/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

protocol BottomViewProtocol: AnyObject {
    var presenter: BottomPresenterProtocol! { get set }    
    func showGithubPage(view: GithubViewProtocol)
}

protocol BottomPresenterProtocol {
    var view: BottomViewProtocol! { get set }
    func setPresenter(for view: GithubViewProtocol)
}
