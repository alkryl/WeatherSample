//
//  InfoModelLayer.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 18.03.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

typealias InfoParameters = (name: String, parameter: String)

struct InfoModelLayer {
    
    private typealias Info = (InfoKey, String)
    
    //MARK: Properties
    
    private var model: InfoModel
    private var list = Array<Info>()
    
    var weatherInfo: [InfoParameters] {
        return list.map { ($0.0.rawValue.uppercased(), $0.1) }
    }
        
    //MARK: Initialization
    
    init(_ model: InfoModel) {
        self.model = model
        self.list = infoList()
    }
    
    //MARK: Private
    
    private func infoList() -> [Info] {
        var infoList = [Info]()
        
        func append(_ value: Info) {
            infoList.append(value)
        }
        
        //sunrise
        let sunriseTime = (model.sunrise + model.timezoneOffset).date().exactTime()
        append((.sunrise, sunriseTime))
        
        //sunset
        let sunsetTime = (model.sunset + model.timezoneOffset).date().exactTime()
        append((.sunset, sunsetTime))
        
        //humidity
        let humidity = model.humidity.toString().withPercent
        append((.humidity, humidity))
        
        //wind
        let direction = model.windDirection.windDirection()
        let speed = model.windSpeed.toInt().toString()
        let wind = direction.withSpace + speed.withMetrePerSecond
        append((.wind, wind))
        
        //feelsLike
        let feelsLike = model.feelsLike.toInt().toString().withDegree
        append((.feelsLike, feelsLike))
        
        //precipitation
        let precipitation = model.precipitation.orEmpty.toString().withCm
        append((.precipitation, precipitation))
        
        //pressure
        let mmHg = model.pressure.toDouble() * K.Number.mmHg
        let pressure = mmHg.toInt().toString().withMmHg
        append((.pressure, pressure))
        
        //visibility
        var visibility: String = .empty
        
        if let vis = model.visibility {
            let km = vis / K.Number.metresInKm
            visibility = km.toString().withKm
        } else {
            visibility = K.Symbol.dash.withKm
        }
        
        append((.visibility, visibility))
                
        //uvi
        let uvi = model.uvi.toInt().toString()
        append((.uvi, uvi))
        
        return infoList
    }
}

//MARK: Keys

private extension InfoModelLayer {
    enum InfoKey: String {
        case sunrise        = "sunrise"
        case sunset         = "sunset"
        case humidity       = "humidity"
        case wind           = "wind"
        case feelsLike      = "feels like"
        case precipitation  = "precipitation"
        case pressure       = "pressure"
        case visibility     = "visibility"
        case uvi            = "uv index"
    }
}
