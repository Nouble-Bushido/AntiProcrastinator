//
//  SplashViewModel.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 22.01.2024.
//

import UIKit

final class SplashViewModel {
    enum Route {
        case requestName, main, info
    }
    private lazy var userManager = UserManager()
    private lazy var isFirstLaunchKey = "isFirstLaunch"
    private  var isFirstLaunch: Bool {
           get {
               return UserDefaults.standard.bool(forKey: isFirstLaunchKey)
           }
           set {
               UserDefaults.standard.set(newValue, forKey: isFirstLaunchKey)
           }
       }
}

//MARK: Public
extension SplashViewModel {
    struct Input {
        let route: (Route) -> Void
    }
    
    struct Output {
        var userDidSelectName: (String) -> Void
    }
    
    func configure(input: Input) -> Output {
        input.route(makeRoute())
        var userDidSelectName: (String) -> Void {
            { [weak self] name in
                let user = User(name: name)
                self?.userManager.set(user: user)
                input.route(.info)
            }
        }
        return Output(userDidSelectName: userDidSelectName)
    }
}

//MARK: Private
private extension SplashViewModel {
    func makeRoute() -> Route {
        let name = userManager.getUser()?.name
        if isFirstLaunch {
               isFirstLaunch = false
               return name == nil ? .requestName : .main
           } else {
               return name == nil ? .requestName : .main
           }
    }
}
