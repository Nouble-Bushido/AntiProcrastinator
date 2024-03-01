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
    
    override func loadView() {
        super.loadView()
        
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let output = viewModel.configure()
        mainView.tableView.setup(tasks: output.tasks)
        mainView.tableView.didSelectItem = { [weak self] selectedTask in
            let vc = TaskPageViewController(task: selectedTask)
            vc.title = "TaskPage.Title.Text".localized
            vc.taskCloseCompletionHandler = { [weak self] in
                let updatedOutput = self?.viewModel.configure() ?? output
                self?.mainView.tableView.setup(tasks: updatedOutput.tasks)
            }
            vc.taskRemoveCompletionHandler = { [weak self] in
                let updatedOutput = self?.viewModel.configure() ?? output
                self?.mainView.tableView.setup(tasks: updatedOutput.tasks)
            }
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        
        actionButtons()
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
        vc.didAddNewTask = { [weak self] in
            guard let self = self else { return }
            let tasks = TaskManager.share.getAllTask()
            self.mainView.tableView.setup(tasks: tasks)
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}
