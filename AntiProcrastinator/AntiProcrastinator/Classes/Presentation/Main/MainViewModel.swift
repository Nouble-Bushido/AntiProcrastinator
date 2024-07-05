//
//  MainViewModel.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 22.02.2024.
//

import Foundation

final class MainViewModel {
    private let userManager: UserManagerProtocol
    private let fatigueManager: FatigueManagerProtocol
    private let taskManager: TaskManagerProtocol
    private var coordinator: MainCoordinator?
    
    init(userManager: UserManagerProtocol, fatigueManager: FatigueManagerProtocol, taskManager: TaskManagerProtocol, coordinator: MainCoordinator? = nil) {
        self.userManager = userManager
        self.fatigueManager = fatigueManager
        self.taskManager = taskManager
        self.coordinator = coordinator
    }
}

//MARK: Public
extension MainViewModel {
    struct Input {
        let selectedDate: Date
    }
    
    struct Output {
        let allElements: [MainTableElements]
    }
    
    func configure(input: Input) -> Output {
        let selectedDate = input.selectedDate
        let tasks = taskManager.getAllTask()
        let fatigue = fatigueManager.getAllFatuguePoints()
        let fatigueLevel = fatigue.determineFatigueLevel
        let name = userManager.getUser()?.name ?? ""
        let description = getDescription(for: fatigueLevel)
        let allElements = buildAllElements(with: tasks,
                                           fatigue: fatigue,
                                           description: description,
                                           name: name,
                                           selectedDate: selectedDate)
        
        return Output(allElements: allElements)
    }
    
    func addTask() {
        coordinator?.showAddTask()
    }
    
    func selectTask(_ task: Task) {
        coordinator?.showTaskPage(for: task)
    }
}

//MARK: Private
private extension MainViewModel {
    func getDescription(for fatigueLevel: Fatigue.FatigueLevel) -> String {
        switch fatigueLevel {
        case .low: return "Main.FatigueLevel.Low.Description.Text".localized
        case .moderate: return "Main.FatigueLevel.Moderate.Description.Text".localized
        case .high: return "Main.FatigueLevel.High.Description.Text".localized
        case .veryHigh: return "Main.FatigueLevel.VeryHigh.Description.Text".localized
        case .extreme:  return "Main.FatigueLevel.Extreme.Description.Text".localized
        }
    }
    
    func buildAllElements(with tasks: [Task], fatigue: Fatigue, description: String, name: String, selectedDate: Date) -> [MainTableElements] {
        let taskForCalendar = filterTasks(for: selectedDate, from: tasks).first ?? Task(id: -1, name: "No tasks", description: "", date: Date(), isCompleted: false)
        
        let taskElements = filterTasks(for: selectedDate, from: tasks).map { MainTableElements.Tasks($0) }
        
        return [.Info(MainInfo(fatiguePoints: fatigue, description: description, userName: name)),
                .Calendar(taskForCalendar)] + taskElements
    }
    
    func filterTasks(for date: Date, from tasks: [Task]) -> [Task] {
        let startOfDay = Calendar.current.startOfDay(for: date)
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: startOfDay)!
        
        return tasks.filter {
            $0.date > startOfDay && $0.date <= tomorrow
        }
    }
}
