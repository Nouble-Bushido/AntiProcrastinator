//
//  MainViewController.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 22.01.2024.
//

import UIKit

final class MainViewController: UIViewController {
    private lazy var mainView = MainView()
    private var viewModel: MainViewModel
    private var selectedDate = Date()
    
        init(viewModel: MainViewModel) {
            self.viewModel = viewModel
            super.init(nibName: nil, bundle: nil)
        }
    
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    override func loadView() {
        super.loadView()
        
        view = mainView
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.tableView.didSelectedDate = { [weak self] selectedDate in
            guard let self = self else { return }
            self.selectedDate = selectedDate
            let output = self.viewModel.configure(input: MainViewModel.Input(selectedDate: selectedDate))
            self.mainView.tableView.setup(allElements: output.allElements)
        }
        
        let output = viewModel.configure(input: MainViewModel.Input(selectedDate: selectedDate))
        mainView.tableView.setup(allElements: output.allElements)
        mainView.tableView.didSelectItem = { [weak self] selectedTask in
            self?.viewModel.selectTask(selectedTask)
        }
        
        actionButtons()
        navigationItem.hidesBackButton = true
    }
    
    func updateTasks() {
         let output = viewModel.configure(input: MainViewModel.Input(selectedDate: selectedDate))
         mainView.tableView.setup(allElements: output.allElements)
     }
}

//MARK: Private
private extension MainViewController {
    func actionButtons() {
        mainView.addTaskButton.addTarget(self, action: #selector(pressAddTaskButton), for: .touchUpInside)
    }
    
    @objc func pressAddTaskButton() {
        viewModel.addTask()
    }
}
