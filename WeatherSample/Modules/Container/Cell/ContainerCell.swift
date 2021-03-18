//
//  ContainerCell.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 13/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import UIKit

class ContainerCell: UITableViewCell {
    
    static let identifier = "ContainerCell"
    static let height: CGFloat = 814.0
    static let shouldHighlight = false
    
    //MARK: Methods
        
    func configureView(with parent: UIViewController) {
        if contentView.subviews.count == 1 { return }
        
        guard let child = parent.storyboard?.instantiateViewController(
            identifier: "TableViewController") else { return }
        
        parent.addChild(child)
        
        let size = CGSize(width: parent.view.bounds.width, height: ContainerCell.height)
        child.view.frame = CGRect(origin: .zero, size: size)
        contentView.addSubview(child.view)
        
        child.didMove(toParent: parent)
    }
}
