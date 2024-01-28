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
    private var didSelectElements: ((InfoTableElement) -> Void)?
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let output = viewModel.configure(input: InfoViewModel.Input(bind: { [weak self] sections in
            self?.mainView.tableView.setup(sections: sections)
        }))
        didSelectElements = output.didSelect
        actionContinueButton()
    }
}

//MARK: Private
private extension InfoViewController {
    func actionContinueButton() {
        mainView.continueButton.addTarget(self, action: #selector(pressContinueButton), for: .touchUpInside)
    }
    
    @objc func pressContinueButton() {
        let mainViewController = MainViewController()
        mainViewController.modalPresentationStyle = .overFullScreen
        UIApplication.shared.keyWindow?.rootViewController = mainViewController
    }
}
