//
//  AddTaskViewController.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 08.02.2024.
//

import UIKit

final class AddTaskViewController: UIViewController {
    private lazy var mainView = AddTaskView()
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK: Private
private extension AddTaskViewController {
    
}
