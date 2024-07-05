//
//  AppDelegate.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 22.01.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var launchManager: LaunchManagerProtocol?
    var taskManager: TaskManagerProtocol?
    var appCoordinator: AppCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let container = DIContainer.shared
        DIContainerConfigurator.configure(container: container)
        
        launchManager = container.resolve(type: LaunchManagerProtocol.self)
        taskManager = container.resolve(type: TaskManagerProtocol.self)
        
        launchManager?.didFinishLaunchingWithOptions()
        taskManager?.configure()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        if let window = window {
            appCoordinator = AppCoordinator(window: window, navigationController: navigationController)
            appCoordinator?.start()
        }
        return true
    }
}
