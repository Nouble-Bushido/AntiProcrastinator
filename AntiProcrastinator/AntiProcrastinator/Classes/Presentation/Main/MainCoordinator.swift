//
//  MainCoordinator.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 30.06.2024.
//

import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    private let factory: ViewControllerFactory
    
    init(navigationController: UINavigationController, factory: ViewControllerFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func start() {
        let vc = factory.createMainViewController(coordinator: self)
        navigationController.setViewControllers([vc], animated: true)
    }
    
    func showAddTask() {
        let addTaskViewController = factory.createAddTaskViewController()
        addTaskViewController.didAddNewTask = { [weak self] in
            guard let self = self else { return }
            if let mainViewController = self.navigationController.viewControllers.first(where: { $0 is MainViewController }) as? MainViewController {
                mainViewController.updateTasks()
            }
        }
        navigationController.pushViewController(addTaskViewController, animated: true)
    }
    
    func showTaskPage(for task: Task) {
        let vc = factory.createTaskPageViewController(task: task)
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
