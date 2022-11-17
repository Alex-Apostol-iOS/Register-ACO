//
//  CacheEntry.swift
//  RegisterACO
//
//  Created by Alex Apostol on 21/5/22.
//

import Foundation


public class CacheEntry: NSObject, NSDiscardableContent {
    
    //MARK: - NSDiscardableContent
    public func beginContentAccess() -> Bool { return true }
    public func endContentAccess() {}
    public func discardContentIfPossible() {}
    public func isContentDiscarded() -> Bool { return false }
    
    public var expiredDate: Date?
    public var value: Any
    
    /// Contructor
    ///
    /// - Parameters:
    ///   - expiredTime: Time in seconds to expire de value. A 0 or negative value indicates that never expires
    ///   - value: value to cache
    public init(value: Any, secondsToExpire seconds: Double) {
        if seconds > 0 {
            self.expiredDate = Date().addingTimeInterval(seconds)
        }
        self.value = value
    }
    
    
    /// returns if this entry has expired
    ///
    /// - Returns: True if has expired, false otherwise.
    public var hasExpired: Bool {
        guard expiredDate != nil else {
            return false
        }
        return expiredDate!.timeIntervalSinceNow < 0
    }
}
