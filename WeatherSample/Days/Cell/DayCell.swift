//
//  DayCell.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 07/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import UIKit

class DayCell: UITableViewCell, DayCellProtocol {
    
    static var nib: UINib {
        return UINib(nibName: "DayCell", bundle: Bundle.main)
    }
    static let identifier = "DayCell"
    static let height:CGFloat = 33
    
    var presenter: DayCellPresenterProtocol!
    
    //MARK: Outlets
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var dayDegreeLabel: UILabel!
    @IBOutlet weak var nightDegreeLabel: UILabel!
    
    //MARK: Methods
    
    func setParameters(day: String, id: Int, dayDegree: String, nightDegree: String) {
        dayLabel.text = day
        iconView.image = UIImage().icon(code: id)
        dayDegreeLabel.text = dayDegree
        nightDegreeLabel.text = nightDegree
    }
}
