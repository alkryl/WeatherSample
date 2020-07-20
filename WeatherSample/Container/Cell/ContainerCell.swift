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
    static let shouldHighlight = false
    static func height(for path: IndexPath) -> CGFloat {
        switch path.row {
        case Content.days:  return 231.0
        case Content.today: return 70.0
        case Content.info:  return 513.0
        default: return 0
        }
    }
    
    //MARK: Methods
        
    func configureView(child: UIViewController, parent: UIViewController, path: IndexPath) {
        if contentView.subviews.count == 1 { return }
        
        parent.addChild(child)
        
        let size = CGSize(width: parent.view.bounds.width,
                          height: ContainerCell.height(for: path))
        child.view.frame = CGRect(origin: .zero, size: size)
        contentView.addSubview(child.view)
        
        child.didMove(toParent: parent)
    }
}
