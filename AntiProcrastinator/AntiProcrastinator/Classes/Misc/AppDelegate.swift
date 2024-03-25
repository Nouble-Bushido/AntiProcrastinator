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

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
        window = UIWindow(frame: UIScreen.main.bounds)

        LaunchManager.shared.didFinishLaunchingWithOptions()
        TaskManager.shared.decreaseFatigueHandler = { [weak fatigueManager = FatigueManager.shared] in
              fatigueManager?.decreaseFatigueRemovedTask()
          }
        
        if let window = window {
            let splashVc = SplashViewController.make()
            window.rootViewController = splashVc
            window.makeKeyAndVisible()
        }
    
        return true
    }
}
