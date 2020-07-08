//
//  HoursPresenter.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 05/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

class HoursPresenter: HoursPresenterProtocol {
    
    private var displayedData: [HoursViewData]!
    
    unowned var view: HoursViewProtocol! {
        didSet {
            updateView()
        }
    }
    
    //MARK: Initialization
    
    required init(model: HoursModel) {
        displayedData = HoursWeather(model).hoursForecast
    }
        
    //MARK: Methods
    
    func updateView() {
        view.updateDisplayedData(displayedData)
        view.updateView()
    }
    
    func setPresenter(for cell: HourCellProtocol, at row: Int) {
        let data = displayedData[row]
        let presenter = HourCellPresenter(model: HourCellModel(hour: data.hour,
                                                               temp: data.temp,
                                                               id: data.id))
        cell.presenter = presenter
        presenter.view = cell
    }
}
