//
//  ViewControllerFactory.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 01.07.2024.
//

import Foundation

protocol ViewControllerFactory {
    static  func createSplashViewController(coordinator: SplashCoordinator) -> SplashViewController
    static  func createNameRequestViewController() -> NameRequestViewController
    static  func createInfoViewController() -> InfoViewController
    static  func createMainViewController(coordinator: MainCoordinator) -> MainViewController
    static  func createAddTaskViewController() -> AddTaskViewController
    static  func createTaskPageViewController(task: Task) -> TaskPageViewController
}
