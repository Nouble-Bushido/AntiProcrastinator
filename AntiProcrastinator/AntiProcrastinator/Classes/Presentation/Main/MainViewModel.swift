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
        let allElements: [MainTableElements]
        let selectedDate: Date
    }
    
    func configure(selectedDate: Date) -> Output {
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
        
        var allElements: [MainTableElements] = [.Info(MainInfo(fatiguePoints: fatigue,
                                                               description: description,
                                                               userName: name))]

        let filteredTasks = filterTasks(for: selectedDate, from: tasks)
        
        if let taskForCalendar = filteredTasks.first {
            allElements.append(.Calendar(taskForCalendar))
        }
        
        let task = filteredTasks.map { MainTableElements.Tasks($0)}
        allElements.append(contentsOf: task)
        
        return Output(allElements: allElements, selectedDate: selectedDate)
    }
}

//MARK: Private
private extension MainViewModel {
    func filterTasks(for date: Date, from tasks: [Task]) -> [Task] {
        let startOfDay = Calendar.current.startOfDay(for: date)
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: startOfDay)!
        
        return tasks.filter {
            $0.date > startOfDay && $0.date <= tomorrow
        }
    }
}
