//
//  SplashCoordinator.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 30.06.2024.
//

import UIKit

class SplashCoordinator: Coordinator {
    var navigationController: UINavigationController
    private let factory: ViewControllerFactory
    
    init(navigationController: UINavigationController, factory: ViewControllerFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func start() {
        let splashViewController = factory.createSplashViewController(coordinator: self)
        splashViewController.navigationItem.backButtonTitle = " "
        navigationController.viewControllers = [splashViewController]
    }

    func showNameRequestScreen() {
        let vc = factory.createNameRequestViewController()
        vc.modalPresentationStyle = .overFullScreen
        vc.onContinue = { [weak self] name in
            self?.handleNameSelected(name)
        }
        navigationController.present(vc, animated: true)
    }
    
    func showMainScreen() {
        let mainCoordinator = MainCoordinator(navigationController: navigationController, factory: factory)
        mainCoordinator.start()
    }
    
    func showInfoScreen() {
        let infoViewController = factory.createInfoViewController()
        infoViewController.closure = {
            self.showMainScreen()
        }
        navigationController.setViewControllers([infoViewController], animated: true)
    }
    
    private func handleNameSelected(_ name: String) {
        let user = User(name: name)
        UserManager().set(user: user)
        dismissAndShowInfoScreen()
    }
    
    private func dismissAndShowInfoScreen() {
        navigationController.presentedViewController?.dismiss(animated: true, completion: {
            self.showInfoScreen()
        })
    }
}
