//
//  ViewControllerFactory.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 01.07.2024.
//

import Foundation

protocol ViewControllerFactory {
    func createSplashViewController(coordinator: SplashCoordinator) -> SplashViewController
    func createNameRequestViewController() -> NameRequestViewController
    func createInfoViewController() -> InfoViewController
    func createMainViewController(coordinator: MainCoordinator) -> MainViewController
    func createAddTaskViewController() -> AddTaskViewController
    func createTaskPageViewController(task: Task) -> TaskPageViewController
}
