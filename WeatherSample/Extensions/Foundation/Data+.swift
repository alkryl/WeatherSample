//
//  Data+.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 02/07/2020.
//  Copyright © 2020 Alexander Krylov. All rights reserved.
//

import Foundation

extension Data {
    func map<T: Decodable>() -> (T?, SampleError?) {
        do {
            let data = try JSONDecoder().decode(T.self, from: self)
            return (data, nil)
        } catch(let error) {
            return (nil, .mapping(reason: error.localizedDescription))
        }
    }
}
