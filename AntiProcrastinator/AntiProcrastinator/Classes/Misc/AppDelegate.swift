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
    var launchManager: LaunchManagerImpl?
    var taskManager: TaskManagerImpl?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)

        let container = DIContainer.shared
        container.register(type: LaunchManagerImpl.self, service: LaunchManager())
        container.register(type: TaskManagerImpl.self, service: TaskManager())
        
        launchManager = container.resolve(type: LaunchManagerImpl.self)
        taskManager = container.resolve(type: TaskManagerImpl.self)
        
        launchManager?.didFinishLaunchingWithOptions()
        taskManager?.configure()
        
        if let window = window {
            let splashVc = SplashViewController.make()
                        window.rootViewController = splashVc
//            let navigationController = UINavigationController(rootViewController: splashVc)
//            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
        
        return true
    }
}
