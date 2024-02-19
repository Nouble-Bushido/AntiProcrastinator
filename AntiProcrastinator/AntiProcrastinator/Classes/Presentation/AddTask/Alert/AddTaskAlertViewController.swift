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
        completed?()
    }
    
    func updateText() {
        if let userName = userManager.getUser()?.name {
            mainView.updateTextLabel(userName: userName)
        }
    }
    
    func animateIn() {
        UIView.animate(withDuration: 0.3, animations:  {
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        }, completion: { done in
            if done {
                UIView.animate(withDuration: 0.3, animations: {
                    self.mainView.whiteBackgroundView.center.y = self.view.frame.midY
                })
            }
        })
    }
}
