//
//  HourCell.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 05/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import UIKit

class HourCell: UICollectionViewCell {
    
    static var nib: UINib {
        return UINib(nibName: HourCell.identifier, bundle: Bundle.main)
    }
    static let identifier = "HourCell"
    static let size = CGSize(width: 60, height: 100)
    
    var presenter: HourCellPresenterProtocol!
    
    //MARK: Outlets
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var degreeLabel: UILabel!
    
    //MARK: Reusable
    
    override func prepareForReuse() {
        super.prepareForReuse()
        hourLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        iconView.image = nil
        degreeLabel.font = UIFont.systemFont(ofSize: 17)
    }
}

//MARK: HourCellProtocol

extension HourCell: HourCellProtocol {
    func setParameters(hour: String, temp: String, id: Int) {
        hourLabel.text = hour   //UTC time!
        iconView.image = UIImage().icon(code: id)
        degreeLabel.text = temp
        view.isHidden = false
    }
    
    func updateView() {
        hourLabel.font = UIFont.boldSystemFont(ofSize: 15)
        degreeLabel.font = UIFont.boldSystemFont(ofSize: 17)
    }
}
