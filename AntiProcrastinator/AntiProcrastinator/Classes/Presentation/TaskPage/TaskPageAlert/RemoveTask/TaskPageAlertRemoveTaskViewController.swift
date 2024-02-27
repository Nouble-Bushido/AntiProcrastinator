//
//  TaskPageAlertRemoveTaskViewController.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 26.02.2024.
//

import UIKit

final class TaskPageAlertRemoveTaskViewController: UIViewController {
    var completed: (() -> Void)?
    
    private lazy var mainView = TaskPageAlertRemoveTaskView()
    private let userManager = UserManager()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        actionButton()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animateIn()
    }
}

//MARK: Private
private extension TaskPageAlertRemoveTaskViewController {
    func actionButton() {
        mainView.closeButton.addTarget(self, action: #selector(pressCloseButton), for: .touchUpInside)
    }
    
    @objc func pressCloseButton() {
        completed?()
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
