//
//  MainViewController.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 22.01.2024.
//

import UIKit

final class MainViewController: UIViewController {
    private lazy var mainView = MainView()
    private lazy var viewModel = MainViewModel()
    private var selectedDate = Date()
    
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
            let vc = TaskPageViewController(task: selectedTask)
            vc.title = "TaskPage.Title.Text".localized
            vc.taskCloseCompletionHandler = { [weak self] in
                let updatedInput = MainViewModel.Input(selectedDate: self?.selectedDate ?? Date())
                let updatedOutput = self?.viewModel.configure(input: updatedInput) ?? output
                self?.mainView.tableView.setup(allElements: updatedOutput.allElements)
            }
            vc.taskRemoveCompletionHandler = { [weak self] in
                let updatedInput = MainViewModel.Input(selectedDate: self?.selectedDate ?? Date())
                let updatedOutput = self?.viewModel.configure(input: updatedInput) ?? output
                self?.mainView.tableView.setup(allElements: updatedOutput.allElements)
            }
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        
        actionButtons()
    }
}

//MARK: Public
extension MainViewController {
    static func make() -> MainViewController {
        let vc = MainViewController()
        vc.navigationItem.backButtonTitle = " "
        vc.title = "Main.Title.Scheduler.Text".localized
        vc.modalPresentationStyle = .overFullScreen
        return vc
    }
}

//MARK: Private
private extension MainViewController {
    func actionButtons() {
        mainView.infoButton.addTarget(self, action: #selector(pressInfoButton), for: .touchUpInside)
        mainView.addTaskButton.addTarget(self, action: #selector(pressAddTaskButton), for: .touchUpInside)
    }
    
    @objc func pressInfoButton() {
        let vc = InfoViewController()
        vc.modalPresentationStyle = .overFullScreen
        UIApplication.shared.keyWindow?.rootViewController = vc
    }
    
    @objc func pressAddTaskButton() {
        let vc = AddTaskViewController.make()
        let taskManager = TaskManager.shared
        vc.didAddNewTask = { [weak self] in
            guard let self = self else { return }
            let output = self.viewModel.configure(input: MainViewModel.Input(selectedDate: self.selectedDate))
            self.mainView.tableView.setup(allElements: output.allElements)
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}
