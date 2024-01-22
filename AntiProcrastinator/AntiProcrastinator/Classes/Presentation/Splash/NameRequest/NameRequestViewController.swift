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
    }
}

//MARK: UITextFieldDelegate
extension NameRequestViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
}

//MARK: Private
private extension NameRequestViewController {

}



