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
    private let factory: ViewControllerFactory

    init(window: UIWindow, navigationController: UINavigationController, factory: ViewControllerFactory) {
        self.window = window
        self.navigationController = navigationController
        self .factory = factory
    }

    func start() {
        showSplashScreen()
    }

    private func showSplashScreen() {
        let splashCoordinator = SplashCoordinator(navigationController: navigationController, factory: factory)
        splashCoordinator.start()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
