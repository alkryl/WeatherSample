//
//  HoursViewController.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 02/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import UIKit

class HoursViewController: UIViewController {
    
    var presenter: HoursPresenterProtocol!
    
    private let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        return layout
    }()
    
    var displayedData = [HoursViewData]()
    
    //MARK: Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(HourCell.nib, forCellWithReuseIdentifier: HourCell.identifier)
        collectionView.collectionViewLayout = layout
    }
}

//MARK: HoursViewProtocol methods

extension HoursViewController: HoursViewProtocol {
    func updateDisplayedData(_ data: [HoursViewData]) {
        self.displayedData = data
    }
    
    func updateView() {
        collectionView.reloadData()
    }
}

//MARK: UICollectionViewDataSource

extension HoursViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return displayedData.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourCell.identifier,
                                                      for: indexPath) as! HourCell
        guard let presenter = presenter else { return cell }
        
        presenter.setPresenter(for: cell, at: indexPath.row)
        
        return cell
    }
}

//MARK: UICollectionViewDelegateFlowLayout

extension HoursViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return HourCell.size
    }
}
