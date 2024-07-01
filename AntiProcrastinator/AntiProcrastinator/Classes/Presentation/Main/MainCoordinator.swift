//
//  MainCoordinator.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 30.06.2024.
//

import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let userManager = UserManager()
        let fatigueManager = FatigueManager()
        let taskManager = DIContainer.shared.resolve(type: TaskManagerProtocol.self)
        let vm = MainViewModel(userManager: userManager, fatigueManager: fatigueManager, taskManager: taskManager, coordinator: self)
        let vc = MainViewController(viewModel: vm)
        navigationController.setViewControllers([vc], animated: true)
    }
    
    func showAddTask() {
        let addTaskViewController = AddTaskViewController()
        addTaskViewController.didAddNewTask = { [weak self] in
            guard let self = self else { return }
            if let mainViewController = self.navigationController.viewControllers.first(where: { $0 is MainViewController }) as? MainViewController {
                mainViewController.updateTasks()
            }
        }
        navigationController.pushViewController(addTaskViewController, animated: true)
    }
    
    func showTaskDetail(for task: Task) {
        let taskManager = DIContainer.shared.resolve(type: TaskManagerProtocol.self)
        let vc = TaskPageViewController(task: task, taskManager: taskManager)
        vc.title = "TaskPage.Title.Text".localized
        vc.taskCloseCompletionHandler = { [weak self] in
            self?.updateMainViewController()
        }
        vc.taskRemoveCompletionHandler = { [weak self] in
            self?.updateMainViewController()
        }
        navigationController.pushViewController(vc, animated: true)
    }
    
    private func updateMainViewController() {
        if let mainViewController = navigationController.viewControllers.first(where: { $0 is MainViewController }) as? MainViewController {
            mainViewController.updateTasks()
        }
    }
}
