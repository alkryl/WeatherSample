//
//  CacheService.swift
//  WeatherSample
//
//  Created by Alexander Krylov on 25.02.2021.
//  Copyright © 2021 Alexander Krylov. All rights reserved.
//

import Foundation

final class CacheService<Key: Hashable, Value> {
    
    private let wrapped = NSCache<WrappedKey, Entry>()
    
    //MARK: Subscripts
    
    subscript(key: Key) -> Value? {
        get { value(forKey: key) }
        set {
            guard let value = newValue else {
                removeValue(forKey: key)
                return
            }
            insert(value, forKey: key)
        }
    }
    
    //MARK: Methods
    
    func insert(_ value: Value, forKey key: Key) {
        let entry = Entry(value: value)
        wrapped.setObject(entry, forKey: WrappedKey(key))
    }

    func value(forKey key: Key) -> Value? {
        let entry = wrapped.object(forKey: WrappedKey(key))
        return entry?.value
    }

    func removeValue(forKey key: Key) {
        wrapped.removeObject(forKey: WrappedKey(key))
    }
}

//MARK: WrappedKey

private extension CacheService {
    final class WrappedKey: NSObject {
        let key: Key

        init(_ key: Key) {
            self.key = key
        }

        override var hash: Int { key.hashValue }

        override func isEqual(_ object: Any?) -> Bool {
            guard let value = object as? WrappedKey else {
                return false
            }
            return value.key == key
        }
    }
}

//MARK: Entry

private extension CacheService {
    final class Entry {
        let value: Value

        init(value: Value) {
            self.value = value
        }
    }
}
