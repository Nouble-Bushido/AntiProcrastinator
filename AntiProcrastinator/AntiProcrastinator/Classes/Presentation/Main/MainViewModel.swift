//
//  MainViewModel.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 22.02.2024.
//

import Foundation

final class MainViewModel {
}

//MARK: Public
extension MainViewModel {
    struct Output {
        let tasks: [Task]
        let fatiguePoints: FatiguePoints
        let fatigueLevel: FatigueLevel
    }
    
    func configure() -> Output {
        let tasks : [Task] = TaskManager.shared.getAllTask()
        let newTasks = TaskManager.shared.getNewTasks(from: tasks)
        
        for task in newTasks {
            let fatigueManager = FatigueManager.shared
            if task.isCompleted {
                fatigueManager.increaseFatigueForCompletedTask()
            } else {
                fatigueManager.decreaseFatigueUncompletedTask()
            }
        }
        
        let fatiguePoints = FatigueManager.shared.getAllFatuguePoints().value
        let fatigueLevel = FatigueManager.shared.getFatigueLevel()
        
        return Output(tasks: tasks, fatiguePoints: FatiguePoints(value: fatiguePoints), fatigueLevel: fatigueLevel)
    }
}
