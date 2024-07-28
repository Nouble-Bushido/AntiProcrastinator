//
//  AppViewControllerFactory.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 01.07.2024.
//

import Foundation

class AppViewControllerFactory: ViewControllerFactory {
    static  func createSplashViewController(coordinator: SplashCoordinator) -> SplashViewController {
        let viewModel = SplashViewModel(userManager: userManager, launchManager: launchManager, coordinator: coordinator )
        return SplashViewController(viewModel: viewModel)
    }
    
    static  func createNameRequestViewController() -> NameRequestViewController {
        return NameRequestViewController()
    }
    
    static  func createInfoViewController() -> InfoViewController {
        return InfoViewController()
    }
    
    static func createMainViewController(coordinator: MainCoordinator) -> MainViewController {
        let viewModel = MainViewModel(userManager: userManager, fatigueManager: fatigueManager, taskManager: taskManager, coordinator: coordinator)
        return MainViewController(viewModel: viewModel)
    }
    
    static func createAddTaskViewController() -> AddTaskViewController {
        return AddTaskViewController()
    }
    
    static func createTaskPageViewController(task: Task) -> TaskPageViewController {
        return TaskPageViewController(task: task, taskManager: taskManager, fatigueManager: fatigueManager, userManager: userManager)
    }
}

//MARK: Private
private extension AppViewControllerFactory {
    private static func resolve<T>(type: T.Type) -> T {
        return DIContainer.shared.resolve(type: type)
    }
    
    private static var userManager: UserManagerProtocol {
        return resolve(type: UserManagerProtocol.self)
    }
    
    private static var fatigueManager: FatigueManagerProtocol {
        return resolve(type: FatigueManagerProtocol.self)
    }
    
    private static var taskManager: TaskManagerProtocol {
        return resolve(type: TaskManagerProtocol.self)
    }
    
    private static var launchManager: LaunchManagerProtocol {
        return resolve(type: LaunchManagerProtocol.self)
    }
}
