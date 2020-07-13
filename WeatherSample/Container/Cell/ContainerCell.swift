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
    static func height(for row: Int) -> CGFloat {
        switch row {
        case Content.top:   return 270
        case Content.hours: return 100
        case Content.days:  return 231
        case Content.today: return 70
        case Content.info:  return 513
        default: return 44
        }
    }
    static func shouldHighlight(_ row: Int) -> Bool {
        return row == Content.hours ? true : false
    }
    
    //MARK: Methods
        
    func configureView(child: UIViewController, parent: UIViewController, row: Int) {
        if contentView.subviews.count == 1 { return }
        
        parent.addChild(child)
        
        let size = CGSize(width: parent.view.bounds.width,
                          height: ContainerCell.height(for: row))
        child.view.frame = CGRect(origin: .zero,
                                  size: size)
        contentView.addSubview(child.view)
        
        child.didMove(toParent: parent)
    }
}

enum Content: Int, CaseIterable {
    case topValue = 0, hoursValue, daysValue, todayValue, infoValue
    
    static var top:   Int { return Content.topValue.rawValue }
    static var hours: Int { return Content.hoursValue.rawValue }
    static var days:  Int { return Content.daysValue.rawValue }
    static var today: Int { return Content.todayValue.rawValue }
    static var info:  Int { return Content.infoValue.rawValue }
}
