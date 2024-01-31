//
//  LaunchManager.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 31.01.2024.
//

import Foundation

final class LaunchManager {
    enum Constants {
        static let lauchKey = "lauchmanager_key"
    }
}

//MARK: Public
extension LaunchManager {
    static func recordFirstLaunch() {
        UserDefaults.standard.set(false, forKey: Constants.lauchKey)
    }
    
    static var isFirstLaunch: Bool {
        return UserDefaults.standard.bool(forKey: Constants.lauchKey)
    }
}
