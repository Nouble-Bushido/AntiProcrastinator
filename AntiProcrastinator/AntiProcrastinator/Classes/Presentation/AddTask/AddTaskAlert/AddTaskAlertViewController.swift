//
//  AddTaskAlertViewController.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 12.02.2024.
//

import UIKit

final class AddTaskAlertViewController: UIViewController {
    var completed: (() -> Void)?
    
    private lazy var mainView = AddTaskAlertView()
    private let userManager = UserManager()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        actionButton()
        updateText()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animateIn()
    }
}

//MARK: Private
private extension AddTaskAlertViewController {
    func actionButton() {
        mainView.closeButton.addTarget(self, action: #selector(pressCloseButton), for: .touchUpInside)
    }
    
    @objc func pressCloseButton() {
        completed?()
    }
    
    func updateText() {
        if let userName = userManager.getUser()?.name {
            mainView.updateTextLabel(userName: userName)
        }
    }
    
    func animateIn() {
        UIView.animate(withDuration: 0.3) {
            self.mainView.whiteBackgroundViewConstraint.isActive = false
            self.mainView.whiteBackgroundViewConstraint = self.mainView.whiteBackgroundView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
            self.mainView.whiteBackgroundViewConstraint.isActive = true
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        }
    }
}
