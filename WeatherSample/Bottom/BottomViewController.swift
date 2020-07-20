//
//  BottomViewController.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 20/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import UIKit

class BottomViewController: UIViewController, BottomViewProtocol {
    
    var presenter: BottomPresenterProtocol!
    
    //MARK: Actions
    
    @IBAction func githubOnTap(_ sender: UIButton) {
        presenter.setPresenter(for: GithubViewController())
    }
}

//MARK: BottomViewProtocol

extension BottomViewController {
    func showGithubPage(view: GithubViewProtocol) {
        present(view as! UIViewController, animated: true, completion: nil)
    }
}
