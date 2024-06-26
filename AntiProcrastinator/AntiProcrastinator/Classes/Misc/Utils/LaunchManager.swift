//
//  LaunchManager.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 31.01.2024.
//

import Foundation

protocol LaunchManagerImpl {
    var isFirstLaunch: Bool { get }
    func didFinishLaunchingWithOptions()
}

final class LaunchManager: LaunchManagerImpl {
    private let launchKey = "launchmanager_key"

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
