//
//  HoursViewController.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 02/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import UIKit

class HoursViewController: UIViewController, HoursViewProtocol {
    
    var presenter: HoursPresenterProtocol!
    
    private let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        return layout
    }()
    
    //MARK: Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(HourCell.nib, forCellWithReuseIdentifier: HourCell.identifier)
        collectionView.collectionViewLayout = layout
    }
    
    //MARK: Methods
    
    func updateUI() {
        collectionView.reloadData()
    }
}

//MARK: UICollectionViewDelegate

extension HoursViewController: UICollectionViewDelegate {
        
    func collectionView(_ collectionView: UICollectionView,
                        shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return false
    }
}

//MARK: UICollectionViewDataSource

extension HoursViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return presenter == nil ? 0 : presenter.numberOfRows()
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourCell.identifier,
                                                      for: indexPath) as! HourCell
        guard let presenter = presenter else { return cell }
        
        var cellPresenter = presenter.cellPresenter(for: indexPath.row)
        cell.presenter = cellPresenter
        cellPresenter.view = cell
        
        return cell
    }
}

extension HoursViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return HourCell.size
    }
}
