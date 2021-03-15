//
//  DayCell.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 07/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import UIKit

final class DayCell: UITableViewCell {
    
    var viewModel: DayCellViewModelProtocol? {
        didSet {
            updateView()
        }
    }
    
    //MARK: Outlets
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var dayDegreeLabel: UILabel!
    @IBOutlet weak var nightDegreeLabel: UILabel!
    
    //MARK: Private
    
    private func updateView() {
        guard let vm = viewModel else { return }
        
        dayLabel.text = vm.day
        iconView.image = UIImage.icon(code: vm.id)
        dayDegreeLabel.text = vm.dayTemperature
        nightDegreeLabel.text = vm.nightTemperature
    }
}
