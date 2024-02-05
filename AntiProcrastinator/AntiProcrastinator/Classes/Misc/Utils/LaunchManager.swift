//
//  LaunchManager.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 31.01.2024.
//

import Foundation

final class LaunchManager {
    static let shared = LaunchManager()
    
    enum Constants {
        static let launchKey = "launchmanager_key"
    }
    private init() {}
}

//MARK: Public
extension LaunchManager {
    
     func recordFirstLaunch() {
        UserDefaults.standard.set(true, forKey: Constants.launchKey)
         UserDefaults.standard.synchronize()
    }
    
     var isFirstLaunch: Bool {
        return UserDefaults.standard.bool(forKey: Constants.launchKey)
    }
    
    func checkAndRecordFirstLaunch() {
        if !isFirstLaunch {
            recordFirstLaunch()
        }
    }
}
