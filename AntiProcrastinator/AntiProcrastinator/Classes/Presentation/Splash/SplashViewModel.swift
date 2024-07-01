//
//  SplashViewModel.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 22.01.2024.
//

import UIKit

enum CoordinatorRoute {
    case requestName
    case main
    case info
}

final class SplashViewModel {
    private let userManager = UserManager()
    private let launchManager = LaunchManager()
    private var coordinator: SplashCoordinator?
    
    init(coordinator: SplashCoordinator? = nil) {
        self.coordinator = coordinator
    }

    func determineInitialRoute() -> CoordinatorRoute {
        let name = userManager.getUser()?.name
        let isFirstLaunch = LaunchManager().isFirstLaunch
        return (isFirstLaunch || name == nil) ? .requestName : .main
    }
    
    func showNameRequestScreen() {
        coordinator?.showNameRequestScreen()
    }
    
    func showMainScreen() {
        coordinator?.showMainScreen()
    }
    
    func showInfoScreen() {
        coordinator?.showInfoScreen()
    }
}
