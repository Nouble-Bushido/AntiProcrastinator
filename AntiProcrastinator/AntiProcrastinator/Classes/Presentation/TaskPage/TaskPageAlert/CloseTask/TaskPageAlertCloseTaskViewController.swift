//
//  TaskPageAlertOpenPageViewController.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 26.02.2024.
//

import UIKit

final class TaskPageAlertCloseTaskViewController: UIViewController {
    var completed: (() -> Void)?
    
    private lazy var mainView = TaskPageAlertCloseTaskView()
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
private extension TaskPageAlertCloseTaskViewController {
    func actionButton() {
        mainView.closeButton.addTarget(self, action: #selector(pressCloseButton), for: .touchUpInside)
    }
    
    @objc func pressCloseButton() {
        animateOut { [weak self] in
            self?.completed?()
        }
    }
    
    func animateIn() {
        self.mainView.whiteBackgroundViewConstraint.isActive = false
        self.mainView.whiteBackgroundViewConstraint = self.mainView.whiteBackgroundView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        self.mainView.whiteBackgroundViewConstraint.isActive = true
        
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.view.layoutIfNeeded()
            self?.view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        }
    }
    
    func animateOut(completion: @escaping () -> Void) {
        self.mainView.whiteBackgroundViewConstraint.isActive = false
        self.mainView.whiteBackgroundViewConstraint = self.mainView.whiteBackgroundView.topAnchor.constraint(equalTo: self.view.bottomAnchor)
        self.mainView.whiteBackgroundViewConstraint.isActive = true
        
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            self?.view.layoutIfNeeded()
            self?.view.backgroundColor = UIColor.black.withAlphaComponent(0)
        }, completion: { _ in
            completion()
        })
    }
}
