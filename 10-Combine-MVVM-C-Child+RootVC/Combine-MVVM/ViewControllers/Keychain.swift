//
//  Keychain.swift
//  Combine-MVVM
//
//  Created by Glenn Posadas on 4/30/21.
//  Copyright © 2021 clarknt. All rights reserved.
//

import Foundation

public enum KeychainKey: String {
  case userId = "KEY_USER_ID"
}

// Arguments for the keychain queries
private let kSecClassValue = NSString(format: kSecClass)
private let kSecAttrAccountValue = NSString(format: kSecAttrAccount)
private let kSecValueDataValue = NSString(format: kSecValueData)
private let kSecClassGenericPasswordValue = NSString(format: kSecClassGenericPassword)
private let kSecAttrServiceValue = NSString(format: kSecAttrService)
private let kSecMatchLimitValue = NSString(format: kSecMatchLimit)
private let kSecReturnDataValue = NSString(format: kSecReturnData)
private let kSecMatchLimitOneValue = NSString(format: kSecMatchLimitOne)

open class Keychain {
  /**
   * Internal methods for querying the keychain.
   */
  
  private class func getKeychainQuery(service: KeychainKey, country: String = "US") -> NSMutableDictionary {
    let serviceStr = service.rawValue + country
    return NSMutableDictionary(dictionary: [kSecClass: kSecClassGenericPassword, kSecAttrService: serviceStr, kSecAttrAccount: serviceStr, kSecAttrAccessible: kSecAttrAccessibleAfterFirstUnlock])
  }
  
  open class func save(service: KeychainKey, data: Any, country: String = "US") {
    // Instantiate a new default keychain query
    let keychainQuery: NSMutableDictionary = getKeychainQuery(service: service, country: country)
    
    // Delete any existing items
    SecItemDelete(keychainQuery as CFDictionary)
    
    keychainQuery.setObject(NSKeyedArchiver.archivedData(withRootObject: data), forKey: kSecValueData as! NSCopying)
    
    // Add the new keychain item
    SecItemAdd(keychainQuery as CFDictionary, nil)
  }
  
  open class func delete(service: KeychainKey, country: String = "US") {
    // Instantiate a new default keychain query
    let keychainQuery: NSMutableDictionary = getKeychainQuery(service: service, country: country)
    
    // Delete any existing items
    SecItemDelete(keychainQuery as CFDictionary)
  }
  
  open class func deleteAllData() {
    let secItemClasses = [kSecClassGenericPassword,
                          kSecClassInternetPassword,
                          kSecClassCertificate,
                          kSecClassKey,
                          kSecClassIdentity]
    for secItemClass in secItemClasses {
      let dictionary = [kSecClass as String: secItemClass]
      SecItemDelete(dictionary as CFDictionary)
    }
  }
  
  open class func load(service: KeychainKey, country: String = "US") -> Any? {
    let keychainQuery: NSMutableDictionary = getKeychainQuery(service: service, country: country)
    keychainQuery.setObject(kCFBooleanTrue as Any, forKey: kSecReturnData as! NSCopying)
    keychainQuery.setObject(kSecMatchLimitOne, forKey: kSecMatchLimit as! NSCopying)
    
    var keyData: AnyObject?
    var contentsOfKeychain: Any? = nil
    
    if SecItemCopyMatching(keychainQuery, &keyData) == noErr {
      if let retrievedData = keyData as? NSData {
        contentsOfKeychain = NSKeyedUnarchiver.unarchiveObject(with: retrievedData as Data)
      }
    }
    
    return contentsOfKeychain
  }
}
