//
//  ContainerViewController.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 29/06/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import UIKit

final class ContainerViewController: UIViewController {
    
    var presenter: ContainerPresenterProtocol!
    let configurator: ContainerConfiguratorProtocol = ContainerConfigurator()
        
    //MARK: Outlets
    
    @IBOutlet private weak var tableView: ContainerTableView!
    @IBOutlet private weak var headerHeight: NSLayoutConstraint!
    
    //MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
    }
}

//MARK: UITableViewDelegate

extension ContainerViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return presenter.tableView(shouldHighlightRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return presenter.tableView(heightForRowAt: indexPath)
    }
}

//MARK: UITableViewDataSource

extension ContainerViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return presenter.tableView(numberOfRowsInSection: section)
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContainerCell.identifier,
                                                       for: indexPath) as? ContainerCell,
              let child = storyboard?.instantiate(TableViewController.self), !cell.isOneSubview
        else { return UITableViewCell() }
        
        addChild(child)
        cell.add(child.view)
        child.didMove(toParent: self)
        
        return cell
    }
}

//MARK: ContainerViewProtocol

extension ContainerViewController: ContainerViewProtocol {
    func updateHeader(with height: FloatType, blocked: Bool) {
        headerHeight.constant = height
        tableView.disableScrolling(blocked)
    }
    
    func updateAlpha(_ value: FloatType) {
        guard let topChild = children.first as? TopViewProtocol else { return }
        topChild.updateAlpha(value)
    }
}

//MARK: UIScrollViewDelegate

extension ContainerViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        presenter.calculateHeightWith(headerHeight.constant,
                                      offset: scrollView.contentOffset.y,
                                      barHeight: (navigationController?.statusBarHeight).orEmpty)
    }
}
