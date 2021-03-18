//
//  HourCell.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 05/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import UIKit

final class HourCell: UICollectionViewCell {
    
    var viewModel: HourCellViewModelProtocol? {
        didSet {
            updateView()
        }
    }
    
    //MARK: Outlets
    
    @IBOutlet private weak var view: UIView!
    @IBOutlet private weak var hourLabel: UILabel!
    @IBOutlet private weak var iconView: UIImageView!
    @IBOutlet private weak var degreeLabel: UILabel!
    
    //MARK: Reusable
    
    override func prepareForReuse() {
        super.prepareForReuse()
        style()
    }
    
    //MARK: Private
    
    private func style() {
        hourLabel.font = UIFont.systemFont(ofSize: K.Font.Size.hour, weight: .light)
        iconView.image = nil
        degreeLabel.font = UIFont.systemFont(ofSize: K.Font.Size.degree)
    }
    
    private func updateView() {
        guard let vm = viewModel else { return }
        
        hourLabel.text = vm.time   //UTC time!
        iconView.image = UIImage.icon(code: vm.id)
        degreeLabel.text = vm.temperature
        
        if vm.styleEvent {
            hourLabel.font = UIFont.boldSystemFont(ofSize: K.Font.Size.hour)
            degreeLabel.font = UIFont.boldSystemFont(ofSize: K.Font.Size.degree)
        }
    }
}
