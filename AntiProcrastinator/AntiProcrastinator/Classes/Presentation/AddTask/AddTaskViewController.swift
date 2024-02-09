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
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let output = viewModel.configure()
        self.mainView.tableView.setup(elements: output.elements)
    }
}

//MARK: Private
private extension AddTaskViewController {
    
}
