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
    private let taskManager = TaskManager.shared
}

//MARK: Public
extension MainViewModel {
    struct Output {
        let tasks: [Task]
        let fatigue: Fatigue
        let selectedDate: Date
        var description: String
        let name: String
    }
    
    func configure(selectedDate: Date) -> Output {
        let tasks = taskManager.getAllTask()
        let fatigue = fatigueManager.getAllFatuguePoints()
        let fatigueLevel = fatigue.level
        let name = userManager.getUser()?.name ?? ""
        
        let filteredTasks = tasks.filter {
            Calendar.current.isDate($0.date, inSameDayAs: selectedDate)
        }
        
        var description: String {
            switch fatigueLevel {
            case .low: return "Main.FatigueLevel.Low.Description.Text".localized
            case  .moderate: return "Main.FatigueLevel.Moderate.Description.Text".localized
            case .high: return "Main.FatigueLevel.High.Description.Text".localized
            case .veryHigh: return "Main.FatigueLevel.VeryHigh.Description.Text".localized
            case .extreme:  return "Main.FatigueLevel.Extreme.Description.Text".localized
            }
        }
        print("MainViewModel\(selectedDate)")
        return Output(tasks: filteredTasks, fatigue: fatigue, selectedDate: selectedDate, description: description, name: name)
    }
}
