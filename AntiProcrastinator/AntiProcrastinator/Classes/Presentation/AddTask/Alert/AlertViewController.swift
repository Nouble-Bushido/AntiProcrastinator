//
//  AlertViewController.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 12.02.2024.
//

import UIKit

final class AlertViewController: UIViewController {
    private lazy var mainView = AlertView()
    private lazy var viewModel = AlertViewModel()
    var completed: (() -> Void)?
    
    override func loadView() {
        super.loadView()
        view = mainView
        view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actionButton()
        updateText()
    }
}

//MARK: Private
private extension AlertViewController {
    func actionButton() {
        mainView.closeButton.addTarget(self, action: #selector(pressCloseButton), for: .touchUpInside)
    }
    
    @objc func pressCloseButton() {
        completed?()
    }
    
    func updateText() {
        let userName = viewModel.getUserName()
        let currentText = mainView.textLabel.text ?? ""
        mainView.textLabel.text = "\(userName) \(currentText)"
    }
}
