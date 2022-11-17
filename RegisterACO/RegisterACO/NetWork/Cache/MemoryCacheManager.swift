//
//  MemoryCacheManager.swift
//  RegisterACO
//
//  Created by Alex Apostol on 21/5/22.
//

import Foundation

public class MemoryCacheManager {
    
    static var shared: MemoryCacheManager = {
        MemoryCacheManager()
    }()
    
    private var cache = NSCache<NSString, CacheEntry>()
    
    /// Get a value of the specified type from cache
    ///
    /// - Parameters:
    ///   - forKey: The associated key to lookup for.
    ///   - type: value type to lookup for.
    /// - Returns: The value if exists and is not expired. Nil otherwise.
    public func value<T>(forKey key: String, type: T.Type) -> T? {
        guard let entry = cache.object(forKey: NSString(string: key)) else {
            return nil
        }
        
        guard !entry.hasExpired else {
            removeValue(forKey: key)
            return nil
        }
        if let value = entry.value as? T {
            return value
        }
        return nil
    }
    
    /// Save a value into cache with time to expire in seconds into scope
    ///
    /// - Parameters:
    ///   - value: The value to save.
    ///   - key: The associated key to save data for.
    ///   - secondsToExpire: num of seconds to expire from now, -1 to never expire.
    public func put(_ value: Any, forKey key: String, secondsToExpire seconds: Double = -1) {
        let entry = CacheEntry(value: value, secondsToExpire: seconds)
        cache.setObject(entry, forKey: NSString(string: key))
    }
    
    /// Remove data associated in cache with a specified identifier 'key'.
    ///
    /// - Parameter forKey: The associated key to remove data for.
    public func removeValue(forKey key: String) {
        cache.removeObject(forKey: NSString(string: key))
    }
    
    /// Clears all objects saved in the cache
    public func clear() {
        cache.removeAllObjects()
    }
}
