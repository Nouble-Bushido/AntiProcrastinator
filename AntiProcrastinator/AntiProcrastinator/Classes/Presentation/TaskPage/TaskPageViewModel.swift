//
//  TaskPageViewModel.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 22.02.2024.
//

import UIKit

final class TaskPageViewModel {
    let task: Task
    
    init(task: Task) {
        self.task = task
    }
}

//MARK: Public
extension TaskPageViewModel {
    struct Input {
        let bind: ([TaskPageElements]) -> Void
    }
    
    func configure(input: Input) {
        var elements: [TaskPageElements] = []
        
        let taskType = generateTaskType()
        elements.append(.image(taskType))
        
        let taskDetails = generateTaskDetails()
        elements.append(.details(task, taskDetails))
        
        if !task.isCompleted {
            elements.append(.buttons)
        }
        
        input.bind(elements)
    }
}

//MARK: Private
private extension TaskPageViewModel {
    func generateTaskType() -> TaskRepresentation {
        let openTask = TaskRepresentation(imageName: "OpenTask.Image", text: "TaskPage.OpenTask.Persuade.Text".localized)
        let completedTask = TaskRepresentation(imageName: "CloseTask.Image", text: "TaskPage.CloseTask.Persuade.Text".localized)
        
        return task.isCompleted ? completedTask : openTask
    }
    
    func generateTaskDetails() -> TaskStatus {
        let openTask = TaskStatus(color: UIColor(integralRed: 22,
                                                 green: 188,
                                                 blue: 0),
                                  text: "TaskPage.OpenStatusTask.Text".localized)
        let completedTask = TaskStatus(color: UIColor(integralRed: 242,
                                                      green: 155,
                                                      blue: 25),
                                       text: "TaskPage.CloseStatusTask.Text".localized)

        return task.isCompleted ? completedTask : openTask
    }
}
