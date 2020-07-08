//
//  InfoPresenter.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 08/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

class InfoPresenter: InfoPresenterProtocol {
    
    private var displayedData: InfoData!
    
    unowned var view: InfoViewProtocol! {
        didSet {
            updateView()
        }
    }
    
    //MARK: Initialization
    
    required init(model: InfoModel) {
        displayedData = InfoViewData(model).info
    }
    
    //MARK: Methods
    
    func updateView() {
        view.updateDisplayedData(displayedData)
        view.updateView()
    }
    
    func setPresenter(for cell: InfoCellProtocol, at row: Int) {
        let data = displayedData[row]
        let presenter = InfoCellPresenter(model: InfoCellModel(name: data.name,
                                                               parameter: data.parameter))
        cell.presenter = presenter
        presenter.view = cell
    }
}
