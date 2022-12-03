//
//  KeyChainSwift.swift
//  InstaTok
//
//  Created by 冯哲宁 on 11/12/22.
//


import Foundation
import KeychainSwift

class KeyChainService{
    var _keyChain = KeychainSwift()
    
    var keyChain: KeychainSwift {
        get {
            return _keyChain
        }
        set {
            _keyChain = newValue
        }
    }
    
}
