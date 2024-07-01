//
//  LaunchManager.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 31.01.2024.
//

import Foundation

protocol LaunchManagerProtocol {
    var isFirstLaunch: Bool { get }
    func didFinishLaunchingWithOptions()
}

final class LaunchManager: LaunchManagerProtocol {
    private let launchKey = "launchmanager_key"
    private let userDefaults: UserDefaultsImpl
    
    init(userDefaults: UserDefaultsImpl = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }

    var isFirstLaunch: Bool {
        return userDefaults.integer(forKey: launchKey) <= 1
    }
    
    func didFinishLaunchingWithOptions() {
        trackAppLaunch()
    }
}

//MARK: Private
private extension LaunchManager {
     func trackAppLaunch() {
        var launchCount = userDefaults.integer(forKey: launchKey)
        launchCount += 1
         userDefaults.set(launchCount, forKey: launchKey)
    }
}
