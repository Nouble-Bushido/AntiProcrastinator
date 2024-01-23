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
        mainView.nameTextField.delegate = self
        mainView.nameTextField.addTarget(self, action: #selector(didInput), for: .editingChanged)
    }
}

//MARK: UITextFieldDelegate
extension NameRequestViewController: UITextFieldDelegate {

}

//MARK: Private
private extension NameRequestViewController {
    @objc func pressContinueButton() {
        guard let enteredName = mainView.nameTextField.text else  { return }
     onContinue?(enteredName)
    }
    
    func actionButton() {
        mainView.continueButton.addTarget(self, action: #selector(pressContinueButton), for: .touchUpInside)
    }
    
    @objc func didInput() {
        actionButton()
        mainView.continueButton.isEnabled = !(mainView.nameTextField.text?.isEmpty ?? true)
    }
}



