//
//  CacheEntry.swift
//  RegisterACO
//
//  Created by Alex Apostol on 21/5/22.
//

import Foundation

@propertyWrapper
struct Cache<T: Codable> {

    let cacheManager: MemoryCacheManager = MemoryCacheManager.shared
    let key: String
    let seconds: Double

    init(key: String, secondsToExpire: Double = -1) {
        self.key = key
        self.seconds = secondsToExpire
    }

    init(_ key: Key) {
        self.key = key.rawValue
        self.seconds = key.secondsToExpire
    }

    var wrappedValue: T? {
        get {
            return cacheManager.value(forKey: key, type: T.self)
        }
        set {
            if let newValue = newValue {
                cacheManager.put(newValue, forKey: key, secondsToExpire: seconds)
                if cacheManager.value(forKey: key, type: T.self) == nil {
                    debugPrint("CacheFail for key \(key)")
                }
            } else {
                cacheManager.removeValue(forKey: key)
            }
        }
    }

}

extension Cache {
    
    enum Key: String {
        case userSession
        
        var secondsToExpire: Double {
            switch self {
            default:
                return -1
            }
        }
    }
}
