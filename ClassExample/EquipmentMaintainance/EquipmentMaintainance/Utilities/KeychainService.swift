//
//  KeychainService.swift
//  EquipmentMaintainance
//
//  Created by 冯哲宁 on 10/22/22.
//

import Foundation
import KeychainSwift

class KeychainService{
    var _keychain = KeychainSwift()
    
    var keyChain: KeychainSwift{
        get{
            return _keychain
        }
        
        set{
            _keychain = newValue
        }
    }
    
    
}
