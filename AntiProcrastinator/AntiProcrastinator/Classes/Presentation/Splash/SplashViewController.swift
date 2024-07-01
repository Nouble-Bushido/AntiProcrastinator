//
//  ViewController.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 22.01.2024.
//

import UIKit

final class SplashViewController: UIViewController {
    lazy var mainView = SplashView()
    private var viewModel: SplashViewModel
    
    init(viewModel: SplashViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView

        let route = viewModel.determineInitialRoute()
        handleRoute(route)
    }

    private func handleRoute(_ route: CoordinatorRoute) {
        switch route {
        case .requestName:
            viewModel.showNameRequestScreen()
        case .main:
            viewModel.showMainScreen()
        case .info:
            viewModel.showInfoScreen()
        }
    }
}
