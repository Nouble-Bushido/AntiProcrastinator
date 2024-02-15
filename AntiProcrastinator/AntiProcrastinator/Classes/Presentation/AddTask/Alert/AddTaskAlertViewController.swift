//
//  AddTaskAlertViewController.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 12.02.2024.
//

import UIKit

final class AddTaskAlertViewController: UIViewController {
    private lazy var mainView = AddTaskAlertView()
    private let userManager = UserManager()
    weak var bottomConstraint: NSLayoutConstraint!
    
    var completed: (() -> Void)?
    
    override func loadView() {
        
        view = mainView
        view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        actionButton()
        updateText()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        animateIn()
    }
}

//MARK: Private
private extension AddTaskAlertViewController {
    func actionButton() {
        mainView.closeButton.addTarget(self, action: #selector(pressCloseButton), for: .touchUpInside)
    }
    
    @objc func pressCloseButton() {
        animateOut()
        completed?()
    }
    
    func updateText() {
        if let userName = userManager.getUser()?.name {
            mainView.updateTextLabel(userName: userName)
        }
    }
    
    func animateIn() {
        mainView.whiteBackgroundView.frame.origin.y = view.frame.height
        UIView.animate(withDuration: 0.5) {
            self.mainView.whiteBackgroundView.frame.origin.y = self.view.frame.height - 300
         }
     }
    
    func animateOut() {
        UIView.animate(withDuration: 1) {
            self.view.backgroundColor?.withAlphaComponent(0)
            self.mainView.whiteBackgroundView.frame.origin.y = self.view.frame.height
        }
    }
}
