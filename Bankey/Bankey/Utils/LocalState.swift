//
//  LocalState.swift
//  Bankey
//
//  Created by Lucas Lacerda on 17/07/22.
//

import Foundation

public class LocalState {
    
    private enum Keys: String {
        case hasOnboarded
    }
    
    public static var hasOnboarded: Bool {
        
        get {
            return UserDefaults.standard.bool(forKey: Keys.hasOnboarded.rawValue)
        }
        
        set(newValue){
            UserDefaults.standard.set(newValue, forKey: Keys.hasOnboarded.rawValue)
            //UserDefaults.standard.synchronize()
            //A partir do iOS 12 nao é mais necessario fazer sincronizacao
            //Apple ja faz por tras dos panos pra gente
        }
        
    }
    
}
