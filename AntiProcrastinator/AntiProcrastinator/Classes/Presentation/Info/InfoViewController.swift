//
//  InfoViewController.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 25.01.2024.
//

import UIKit

final class InfoViewController: UIViewController {
    private lazy var mainView = InfoView()
    private lazy var flooterView = TableViewFooter()
    private var viewModel = InfoViewModel()
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.configure(input: InfoViewModel.Input(bind: { [weak self] sections in
            self?.mainView.tableView.setup(sections: sections)
        }))
        actionContinueButton()
    }
}

//MARK: Private
private extension InfoViewController {
    func actionContinueButton() {
        flooterView.continueButton.addTarget(self, action: #selector(pressContinueButton), for: .touchUpInside)
    }
    
    @objc func pressContinueButton() {
        let mainViewController = MainViewController()
        mainViewController.modalPresentationStyle = .overFullScreen
        UIApplication.shared.keyWindow?.rootViewController = mainViewController
    }
}
