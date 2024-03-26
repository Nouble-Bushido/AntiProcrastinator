//
//  MainViewModel.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 22.02.2024.
//

import Foundation

final class MainViewModel {
    private let userManager = UserManager()
    private let fatigueManager = FatigueManager()
    private let taskManager = TaskManager()
}

//MARK: Public
extension MainViewModel {
    struct Output {
        let tasks: [Task]
        let fatigue: Fatigue
        var description: String
        let name: String
    }
    
    func configure() -> Output {
        let tasks = taskManager.getAllTask()
        let fatigue = fatigueManager.getAllFatuguePoints()
        let fatigueLevel = fatigue.level
        let name = userManager.getUser()?.name ?? ""
        
        var description: String {
            switch fatigueLevel {
            case .low: return "Main.FatigueLevel.Low.Description.Text".localized
            case  .moderate: return "Main.FatigueLevel.Moderate.Description.Text".localized
            case .high: return "Main.FatigueLevel.High.Description.Text".localized
            case .veryHigh: return "Main.FatigueLevel.VeryHigh.Description.Text".localized
            case .extreme:  return "Main.FatigueLevel.Extreme.Description.Text".localized
            }
        }
  
        return Output(tasks: tasks, fatigue: fatigue, description: description, name: name)
    }
}
