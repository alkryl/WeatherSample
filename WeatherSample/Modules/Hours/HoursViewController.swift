//
//  HoursViewController.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 02/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import UIKit

final class HoursViewController: UIViewController {
    
    var presenter: HoursPresenterProtocol!
    let configurator: HoursConfiguratorProtocol = HoursConfigurator()
    
    //MARK: Outlets
    
    @IBOutlet private weak var collectionView: HoursCollectionView!
    
    //MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.getWeather()
    }
}

//MARK: UICollectionViewDataSource

extension HoursViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return presenter.collectionView(numberOfItemsInSection: section)
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourCell.identifier, for: indexPath) as? HourCell else { return UICollectionViewCell() }
        
        let parameters = presenter.hourParametersForCell(at: indexPath)
        cell.viewModel = HourCellViewModel(parameters: parameters)
        
        return cell
    }
}

//MARK: UICollectionViewDelegateFlowLayout

extension HoursViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return presenter.collectionView(sizeForItemAt: indexPath)
    }
}

//MARK: HoursViewProtocol

extension HoursViewController: HoursViewProtocol { }
