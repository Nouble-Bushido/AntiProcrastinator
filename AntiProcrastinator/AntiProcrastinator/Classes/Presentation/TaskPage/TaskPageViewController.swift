//
//  TaskPageViewController.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 22.02.2024.
//

import UIKit

final class TaskPageViewController: UIViewController {
    var taskСloseCompletionHandler: (() -> Void)?
    var taskRemoveCompletionHandler: (() -> Void)?
    
    private var viewModel: TaskPageViewModel
    
    init(task: Task) {
        self.viewModel = TaskPageViewModel(task: task)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.configure(input: TaskPageViewModel.Input(route: route))
    }
}

//MARK: Private
private extension TaskPageViewController {
    var route: (TaskPageViewModel.Route) -> Void {
        { route in
            switch route {
            case .openTask:
                self.openTask()
            case .closeTask:
                self.closeTask()
            }
        }
    }
    
    func openTask() {
        let vc = TaskPageOpenTaskView()
        view = vc
        vc.closeTaskButton.addTarget(self, action: #selector(pressedCloseButton), for: .touchUpInside)
        vc.removeTaskButton.addTarget(self, action: #selector(pressedRemoveButton), for: .touchUpInside)
        vc.setupTask(task: viewModel.task)
    }
    
    func closeTask() {
        let vc = TaskPageClosedTaskView()
        view = vc
        vc.setupTask(task: viewModel.task)
    }
    
    @objc func pressedCloseButton() {
        let vc = TaskPageAlertCloseTaskViewController()
        TaskManager.share.completeTask(withId: self.viewModel.task.id)
        taskСloseCompletionHandler?()
        vc.completed = { [weak self] in
            self?.dismiss(animated: false) { [weak self] in
                self?.navigationController?.popToRootViewController(animated: true)
            }
        }
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    @objc func pressedRemoveButton() {
        let vc = TaskPageAlertRemoveTaskViewController()
        TaskManager.share.removeTask(withId: self.viewModel.task.id)
        taskRemoveCompletionHandler?()
        vc.completed = { [weak self] in
            self?.dismiss(animated: false) { [weak self] in
                self?.navigationController?.popToRootViewController(animated: true)
            }
        }
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
}
