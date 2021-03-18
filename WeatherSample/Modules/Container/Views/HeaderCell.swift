//
//  HeaderCell.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 16/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewHeaderFooterView {
    
    static var nib: UINib {
        return UINib(nibName: "HeaderCell", bundle: Bundle.main)
    }
    static let identifier = "HeaderCell"
    static func height(for section: Int) -> CGFloat {
        return section == Section.empty ? 0 : 100.0
    }

    //MARK: Outlets
    
    @IBOutlet weak var topContainer: UIView!
    @IBOutlet weak var hoursContainer: UIView!
    
    //MARK: Methods
            
    func configureHeader(child: UIViewController, parent: UIViewController,
                         section: Int = Section.content) {
        parent.addChild(child)
        
        let parentWidth = parent.view.bounds.width

        if child is TopViewProtocol {
            child.view.frame = CGRect(origin: .zero, size:
                CGSize(width: parentWidth, height: topContainer.bounds.height))
            topContainer.addSubview(child.view)
        } else {
            child.view.frame = CGRect(origin: .zero, size:
                CGSize(width: parentWidth, height: hoursContainer.bounds.height))
            hoursContainer.addSubview(child.view)
        }
        child.didMove(toParent: parent)
    }
}
