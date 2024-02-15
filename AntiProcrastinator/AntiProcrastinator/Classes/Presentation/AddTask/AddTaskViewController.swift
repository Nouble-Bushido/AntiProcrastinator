//
//  AddTaskViewController.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 08.02.2024.
//

import UIKit

final class AddTaskViewController: UIViewController {
    private lazy var mainView = AddTaskView()
    private lazy var viewModel = AddTaskViewModel()
    
    override func loadView() {
        
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldDidChange()
        actionReadyButton()
    }
}

//MARK: Public
extension AddTaskViewController {
    static func make() -> AddTaskViewController {
        let vc = AddTaskViewController()
        vc.title = "AddTask.Title.Text".localized
        return vc
    }
}

//MARK: Private
private extension AddTaskViewController {
    func actionReadyButton() {
        mainView.readyButton.addTarget(self, action: #selector(readyButtonTapped), for: .touchUpInside)
    }
    
    @objc func readyButtonTapped() {
        let name = mainView.nameTextField.text ?? ""
        let description = mainView.descriptionTextField.text ?? ""
        let date = mainView.datePicker.date
        viewModel.saveTask(name: name, description: description, date: date)
        showAlerVC()
    }
    
    func showAlerVC() {
        let vc = AddTaskAlertViewController()
        vc.completed = { [weak self] in
            self?.dismiss(animated: false) { [weak self] in
                self?.navigationController?.popToRootViewController(animated: true)
            }
        }
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: false)
    }
    
    func textFieldDidChange() {
        mainView.nameTextField.addTarget(self,
                                         action: #selector(textFieldEditingChangedHandler),
                                         for: .editingChanged)
        mainView.descriptionTextField.addTarget(self,
                                                action: #selector(textFieldEditingChangedHandler),
                                                for: .editingChanged)
    }
    
    @objc func textFieldEditingChangedHandler() {
        let isNameEntered = !(mainView.nameTextField.text?.isEmpty ?? true)
        let isDescriptionEntered = !(mainView.descriptionTextField.text?.isEmpty ?? true)
        
        if isNameEntered && isDescriptionEntered {
            mainView.readyButton.isEnabled = true
            mainView.readyButton.backgroundColor = UIColor(integralRed: 28, green: 55, blue: 209, alpha: 1)
        } else {
            mainView.readyButton.isEnabled = false
            mainView.readyButton.backgroundColor = UIColor(integralRed: 28, green: 55, blue: 209, alpha: 0.6)
        }
    }
}
