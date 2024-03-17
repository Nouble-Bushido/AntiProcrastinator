//
//  MainViewModel.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 22.02.2024.
//

import Foundation

final class MainViewModel {
    private let userManager = UserManager()
    private let fatigueManager = FatigueManager.shared
}

//MARK: Public
extension MainViewModel {
    struct Output {
        let tasks: [Task]
        let fatiguePoints: FatiguePoints
        var description: String
        let name: String
    }
    
    func configure() -> Output {
        let tasks = TaskManager.shared.getAllTask()
        let fatiguePoints = fatigueManager.getAllFatuguePoints()
        let fatigueLevel = fatigueManager.getFatigueLevel()
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
        
        TaskManager.shared.recalculateFatiguePointsAtEndOfDay(tasks: tasks)
        
        return Output(tasks: tasks, fatiguePoints: fatiguePoints, description: description, name: name)
    }
}
