//
//  MainCoordinator.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 30.06.2024.
//

import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    var closureUpdateTasks: (() -> Void)?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.closureUpdateTasks = { [weak self] in
            self?.updateMainViewController()
        }
    }
    
    func start() {
        let vc = AppViewControllerFactory.createMainViewController(coordinator: self)
        navigationController.setViewControllers([vc], animated: true)
    }
    
    func showAddTask() {
        let addTaskViewController = AppViewControllerFactory.createAddTaskViewController()
        addTaskViewController.didAddNewTask = closureUpdateTasks
        navigationController.pushViewController(addTaskViewController, animated: true)
    }
    
    func showTaskPage(for task: Task) {
        let vc = AppViewControllerFactory.createTaskPageViewController(task: task)
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
        let mainViewController = navigationController.viewControllers.compactMap { $0 as? MainViewController }.first
        mainViewController?.updateTasks()
    }
}
