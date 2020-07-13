//
//  CustomToolbar.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 09/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import UIKit

class CustomToolbar: UIToolbar {
    
    var githubButton: UIButton!
        
    //MARK: Initialization

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubviews()
    }
    
    //MARK: Private
    
    private func addSubviews() {
        let point = CGPoint(x: 30, y: bounds.size.height / 2)
        let size  = CGSize(width: 30, height: 30)
        githubButton = UIButton(frame: CGRect(origin: point, size: size))
        githubButton.setImage(UIImage(named: "github"), for: .normal)
        addSubview(githubButton)
    }
}
