//
//  LaunchManager.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 31.01.2024.
//

import Foundation

final class LaunchManager {
    static let shared = LaunchManager()
    
    private let launchKey = "launchmanager_key"
    
    private init() {}
}

//MARK: Public
extension LaunchManager {
    var isFirstLaunch: Bool {
        return UserDefaults.standard.integer(forKey: launchKey) <= 1
    }
    
    func didFinishLaunchingWithOptions() {
        trackAppLaunch()
    }
}

//MARK: Private
private extension LaunchManager {
     func trackAppLaunch() {
        var launchCount = UserDefaults.standard.integer(forKey: launchKey)
        launchCount += 1
        UserDefaults.standard.set(launchCount, forKey: launchKey)
    }
}

