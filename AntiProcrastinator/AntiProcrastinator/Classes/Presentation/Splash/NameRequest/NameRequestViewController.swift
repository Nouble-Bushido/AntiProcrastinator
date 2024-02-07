//
//  NameRequestViewController.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 22.01.2024.
//

import UIKit

final class NameRequestViewController: UIViewController {
    private lazy var mainView = NameView()
    var onContinue: ((String) -> Void)?
    
    override func loadView() {
        super.loadView()
        view = mainView
        view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.nameTextField.addTarget(self, action: #selector(didInput), for: .editingChanged)
        actionButton()
    }
}

//MARK: Private
private extension NameRequestViewController {
    func actionButton() {
        mainView.continueButton.addTarget(self, action: #selector(pressContinueButton), for: .touchUpInside)
    }
    
    @objc func pressContinueButton() {
        guard let enteredName = mainView.nameTextField.text else  { return }
     onContinue?(enteredName)
    }
    
    @objc func didInput() {
        let isNameEntered = !(mainView.nameTextField.text?.isEmpty ?? true)
        mainView.continueButton.isEnabled = isNameEntered
        mainView.continueButton.backgroundColor = isNameEntered ? UIColor(integralRed: 28, green: 55, blue: 209, alpha: 1) : UIColor(integralRed: 28, green: 55, blue: 209, alpha: 0.6)
    }
}
