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
    private var didSelectElements: ((AllElements) -> Void)?
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

      let output = viewModel.configure(input: InfoViewModel.Input(bind: { [weak self] allElements in
            self?.mainView.tableView.setup(allElements: allElements)}))
        didSelectElements = output.didSelect
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
    
    @objc func pressContinueButton() {
        let mainViewController = MainViewController()
        mainViewController.modalPresentationStyle = .overFullScreen
        UIApplication.shared.keyWindow?.rootViewController = mainViewController
    }
}
