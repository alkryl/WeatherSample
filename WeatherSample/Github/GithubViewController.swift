//
//  GithubViewController.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 10/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import UIKit
import WebKit

final class GithubViewController: UIViewController {
    
    var presenter: GithubPresenter!
    
    //MARK: Outlets
    
    @IBOutlet private weak var webView: WKWebView!
        
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = GithubPresenter(view: self)
        presenter.configureView()
    }
}

//MARK: GithubViewProtocol

extension GithubViewController: GithubViewProtocol {
    func showGithub(with request: URLRequest) {
        webView.load(request)
    }
}
