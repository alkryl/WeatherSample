//
//  InfoCell.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 08/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import UIKit

class InfoCell: UITableViewCell {

    static var nib: UINib {
        return UINib(nibName: "InfoCell", bundle: Bundle.main)
    }
    static let identifier = "InfoCell"
    static let height: CGFloat = 57
    
    var presenter: InfoCellPresenterProtocol!
    
    //MARK: Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
}

//MARK: InfoCellProtocol

extension InfoCell: InfoCellProtocol {
    func setParameters(name: String, parameter: String) {
        nameLabel.text = name
        valueLabel.text = parameter
    }
}
