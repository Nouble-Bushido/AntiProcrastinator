//
//  ViewController.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 22.01.2024.
//

import UIKit

class SplashViewController: UIViewController {
    lazy var mainView = SplashView()
    
    private lazy var viewModel = SplashViewModel()
    private var userDidSelectName: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView

        let output = viewModel.configure(input: SplashViewModel.Input(route: route))
        userDidSelectName = output.userDidSelectName
    }
}

//MARK: Public
extension SplashViewController {
    static func make() -> SplashViewController {
        let vc = SplashViewController()
        vc.navigationItem.backButtonTitle = " "
        return vc
    }
}

//MARK: Private
private extension SplashViewController {
    var route: (SplashViewModel.Route) -> Void {
        { route in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                guard let self = self else { return }
                switch route {
                case .requestName:
                    self.presentNameRequest()
                case .main:
                    self.presentMain()
                case .info:
                    self.presentInfo()
                }
            }
        }
    }
    
    func presentNameRequest() {
        let vc = NameRequestViewController()
        vc.modalPresentationStyle = .overFullScreen
        vc.onContinue = { [weak self] name in
            self?.userDidSelectName?(name)
        }
        present(vc, animated: true)
    }
    
    func presentInfo() {
        let vc = InfoViewController()
        vc.modalPresentationStyle = .overFullScreen
        UIApplication.shared.keyWindow?.rootViewController = vc
    }
    
    func presentMain() {
        let vc = MainViewController()
        let navigationController = UINavigationController(rootViewController: vc)
        vc.navigationItem.backButtonTitle = " "
        vc.modalPresentationStyle = .overFullScreen
        UIApplication.shared.keyWindow?.rootViewController = navigationController
    }
}
