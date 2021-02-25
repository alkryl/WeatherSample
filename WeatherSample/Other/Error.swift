//
//  Error.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 23.02.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

import Foundation

enum Reason {
    static let invalidUrl = "Invalid url"
}

enum SampleError: Error {
    case obtaining(reason: String)
    case invalid(reason: String)
    case mapping(reason: String)
    case location(reason: String)
}

extension SampleError {
    var description: String {
        switch self {
        case let .obtaining(reason): return "Obtaining: \(reason)"
        case let .invalid(reason):   return "Invalid: \(reason)"
        case let .mapping(reason):   return "Mapping: \(reason)"
        case let .location(reason):  return "Location: \(reason)"
        }
    }
}
