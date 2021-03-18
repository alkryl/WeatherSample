//
//  InfoCell.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 08/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import UIKit

final class InfoCell: UITableViewCell {
    
    var viewModel: InfoCellViewModelProtocol? {
        didSet {
            updateView()
        }
    }
    
    //MARK: Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    //MARK: Private
    
    private func updateView() {
        guard let vm = viewModel else { return }
        
        nameLabel.text = vm.name
        valueLabel.text = vm.parameter
    }
}
