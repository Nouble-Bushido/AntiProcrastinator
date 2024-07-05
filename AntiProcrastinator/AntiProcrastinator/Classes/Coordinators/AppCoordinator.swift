//
//  AppCoordinator.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 28.06.2024.
//

import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    private let window: UIWindow

    init(window: UIWindow, navigationController: UINavigationController) {
        self.window = window
        self.navigationController = navigationController
    }

    func start() {
        showSplashScreen()
    }

    private func showSplashScreen() {
        let splashCoordinator = SplashCoordinator(navigationController: navigationController)
        splashCoordinator.start()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
