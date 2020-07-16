//
//  GithubViewController.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 10/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import UIKit
import WebKit

class GithubViewController: UIViewController {
    
    static var nib: GithubViewController {
        return UIStoryboard().main.instantiateViewController(identifier: "GithubViewController")
    }
    var presenter: GithubPresenterProtocol!
    
    private var webView: WKWebView!
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView(frame: view.bounds)
        view.addSubview(webView)
    }
}

//MARK: GithubViewProtocol methods

extension GithubViewController: GithubViewProtocol {
    func showGithub(with request: URLRequest) {
        webView.load(request)
    }
}