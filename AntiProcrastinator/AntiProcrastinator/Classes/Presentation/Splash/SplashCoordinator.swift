//
//  SplashCoordinator.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 30.06.2024.
//

import UIKit

class SplashCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let splashViewController = AppViewControllerFactory.createSplashViewController(coordinator: self)
        splashViewController.navigationItem.backButtonTitle = " "
        navigationController.viewControllers = [splashViewController]
    }

    func showNameRequestScreen() {
        let vc = AppViewControllerFactory.createNameRequestViewController()
        vc.modalPresentationStyle = .overFullScreen
        vc.onContinue = { [weak self] name in
            self?.handleNameSelected(name)
        }
        navigationController.present(vc, animated: true)
    }
    
    func showMainScreen() {
        let mainCoordinator = MainCoordinator(navigationController: navigationController)
        mainCoordinator.start()
    }
    
    func showInfoScreen() {
        let infoViewController = AppViewControllerFactory.createInfoViewController()
        infoViewController.didTappedButton = {
            self.showMainScreen()
        }
        navigationController.setViewControllers([infoViewController], animated: true)
    }
    
    private func handleNameSelected(_ name: String) {
        let user = User(name: name)
        let userManager = DIContainer.shared.resolve(type: UserManagerProtocol.self)
        userManager.set(user: user)
        dismissAndShowInfoScreen()
    }
    
    private func dismissAndShowInfoScreen() {
        navigationController.presentedViewController?.dismiss(animated: true, completion: { [weak self] in
            self?.showInfoScreen()
        })
    }
}
