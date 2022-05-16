//
//  KeychainHelper.swift
//  RegisterACO
//
//  Created by Alex Apostol on 8/5/22.
//

import Foundation

final class KeychainHelper  {
    static let sharedInstance = KeychainHelper()
    
    private init(){}
    
    func save(_ data: Data, service: KeyChainService, account: KeyChainAccount) {
        
        // Create query
        let query = [
            kSecValueData: data,
            kSecClass: kSecClassIdentity,
            kSecAttrService: service.rawValue,
            kSecAttrAccount: account.rawValue,
        ] as CFDictionary
        
        // Add data in query to keychain
        let status = SecItemAdd(query, nil)
        
        if status != errSecSuccess {
            // Print out the error
            print("Error: \(status)")
        }
    }
    
    func read(service: KeyChainService, account: KeyChainAccount) -> Data? {
        
        let query = [
            kSecAttrService: service.rawValue,
            kSecAttrAccount: account.rawValue,
            kSecClass: kSecClassIdentity,
            kSecReturnData: true
        ] as CFDictionary
        
        var result: AnyObject?
        SecItemCopyMatching(query, &result)
        
        return (result as? Data)
    }
    
    func delete(service: KeyChainService, account: KeyChainAccount) {
        
        let query = [
            kSecAttrService: service.rawValue,
            kSecAttrAccount: account.rawValue,
            kSecClass: kSecClassGenericPassword,
            ] as CFDictionary
        
        // Delete item from keychain
        SecItemDelete(query)
    }
}

enum KeyChainAccount: String {
    case registerACO = "registerACO"
}

enum KeyChainService: String {
    case user_Id = "user_Id"
}
