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
    var isFirstLaunch: Bool {
        return UserDefaults.standard.integer(forKey: launchKey) <= 1
    }
    
    private init() {}
}

//MARK: Public
extension LaunchManager {
    func didFinishLaunchingWithOptions() {
        trackAppLaunch()
    }
}

//MARK: Private
private extension LaunchManager {
    private func trackAppLaunch() {
        let launchCount = UserDefaults.standard.integer(forKey: launchKey)
        UserDefaults.standard.set((launchCount == 0) ? 1 : 2, forKey: launchKey)
    }
}

