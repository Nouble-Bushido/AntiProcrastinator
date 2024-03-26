//
//  InfoViewController.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 25.01.2024.
//

import UIKit

final class InfoViewController: UIViewController {
    private lazy var mainView = InfoView()
    private var viewModel = InfoViewModel()
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let output = viewModel.configure()
        mainView.tableView.setup(allElements: output.allElements)
        
        actionContinueButton()
    }
}

//MARK: Private
private extension InfoViewController {
    func actionContinueButton() {
        mainView.tableView.continueButtonTappedHandler = { [weak self ] in
            self?.pressContinueButton()
        }
    }
    
     func pressContinueButton() {
         let vc = MainViewController.make()
        UIApplication.shared.keyWindow?.rootViewController = vc
    }
}
