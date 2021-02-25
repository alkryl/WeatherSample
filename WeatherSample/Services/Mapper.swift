//
//  Mapper.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 25.02.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

import Foundation

protocol MapperProtocol {
    func map(_ data: Data) -> (mapped: WeatherJSON?, error: SampleError?)
}

struct Mapper: MapperProtocol {
    func map(_ data: Data) -> (mapped: WeatherJSON?, error: SampleError?) {
        return data.map()
    }
}
