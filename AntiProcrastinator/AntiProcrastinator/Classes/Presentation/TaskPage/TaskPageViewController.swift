//
//  TaskPageViewController.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 22.02.2024.
//

import UIKit

final class TaskPageViewController: UIViewController {
    lazy var mainView = TaskPageView()
    var taskCloseCompletionHandler: (() -> Void)?
    var taskRemoveCompletionHandler: (() -> Void)?
    
    private var viewModel: TaskPageViewModel
    private let taskManager = TaskManager.shared
    private let fatigueManager = FatigueManager()
    
    init(task: Task) {
        self.viewModel = TaskPageViewModel(task: task)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.configure(input: TaskPageViewModel.Input(bind: { [weak self] elements in
            self?.mainView.tableView.setup(elements: elements)
        }))
        
        actionButtons()
    }
}

//MARK: Private
private extension TaskPageViewController {
    func actionButtons() {
        mainView.tableView.completeButtonTappedHandler = { [weak self] in
            self?.goToTaskPageAlertCloseTaskVC()
        }
        mainView.tableView.removeButtonTappedHandler = { [weak self] in
            self?.goToTaskPageAlertRemoveTaskVC()
        }
    }
    
    func goToTaskPageAlertCloseTaskVC() {
        let vc = TaskPageAlertCloseTaskViewController()
        taskManager.completeTask(withId: viewModel.task.id)
        fatigueManager.increaseFatigueForCompletedTask()
        vc.completed = { [weak self] in
            self?.dismiss(animated: false) { [weak self] in
                self?.navigationController?.popToRootViewController(animated: true)
                self?.taskCloseCompletionHandler?()
            }
        }
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    func goToTaskPageAlertRemoveTaskVC() {
        let vc = TaskPageAlertRemoveTaskViewController()
        taskManager.removeTask(withId: viewModel.task.id)
        vc.completed = { [weak self] in
            self?.dismiss(animated: false) { [weak self] in
                self?.navigationController?.popToRootViewController(animated: true)
                self?.taskRemoveCompletionHandler?()
            }
        }
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
}
