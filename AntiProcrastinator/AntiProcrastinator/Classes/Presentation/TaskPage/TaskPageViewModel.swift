//
//  TaskPageViewModel.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 22.02.2024.
//

import Foundation
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
    
    struct Output {
        let didSelectTask: (TaskPageElements) -> Void
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
    func generateTaskType() -> TaskStatus {
        let closeImage = UIImage(named: "CloseTask.Image") ?? UIImage()
        let openImage = UIImage(named: "OpenTask.Image") ?? UIImage()
        let closeText = "TaskPage.CloseTask.Persuade.Text".localized
        let openText = "TaskPage.OpenTask.Persuade.Text".localized
        
        return task.isCompleted ? .completed(closeImage, closeText) : .open(openImage, openText)
    }
    
    func generateTaskDetails() -> TaskStatus {
        let closeIndicator = UIImage(named: "CloseIndicator.Image") ?? UIImage()
        let openIndicator = UIImage(named: "OpenIndicator.Image") ?? UIImage()
        let closeStatusText = "TaskPage.CloseStatusTask.Text".localized
        let openStatusText = "TaskPage.OpenStatusTask.Text".localized
        
        return task.isCompleted ? .completed(closeIndicator, closeStatusText) : .open(openIndicator, openStatusText)
    }
}
