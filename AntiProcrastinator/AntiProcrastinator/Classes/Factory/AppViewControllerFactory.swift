//
//  AppViewControllerFactory.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 01.07.2024.
//

import Foundation

class AppViewControllerFactory: ViewControllerFactory {
    func createSplashViewController(coordinator: SplashCoordinator) -> SplashViewController {
        let viewModel = SplashViewModel(coordinator: coordinator)
        return SplashViewController(viewModel: viewModel)
    }
    
    func createNameRequestViewController() -> NameRequestViewController {
        return NameRequestViewController()
    }
    
    func createInfoViewController() -> InfoViewController {
        return InfoViewController()
    }
    
    func createMainViewController(coordinator: MainCoordinator) -> MainViewController {
        let userManager = UserManager()
        let fatigueManager = FatigueManager()
        let taskManger = DIContainer.shared.resolve(type: TaskManagerProtocol.self)
        let viewModel = MainViewModel(userManager: userManager, fatigueManager: fatigueManager, taskManager: taskManger, coordinator: coordinator)
        return MainViewController(viewModel: viewModel)
    }
    
    func createAddTaskViewController() -> AddTaskViewController {
        return AddTaskViewController()
    }
    
    func createTaskPageViewController(task: Task) -> TaskPageViewController {
        let taskManager = DIContainer.shared.resolve(type: TaskManagerProtocol.self)
        return TaskPageViewController(task: task, taskManager: taskManager)
    }
}
