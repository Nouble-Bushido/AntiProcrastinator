//
//  TaskManager.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 08.02.2024.
//

import Foundation

final class TaskManager {
    static let shared = TaskManager()
    
    var decreaseFatigueHandler: (() -> Void)?
    
    enum Constants {
        static let taskKey = "task_manager_task_key"
        static let lastCalculationDate = "task_manager_last_recalculation_date_key"
    }
    
    private var tasks: [Task] = []
    private var lastCalculationDate: Date? {
        didSet {
            saveLastCalculationDate()
        }
    }
    
    private init() {}
}

//MARK: Public
extension TaskManager {
    func configure() {
        if let tasksData = UserDefaults.standard.data(forKey: Constants.taskKey) {
            let decoder = JSONDecoder()
            if let decodedTasks = try? decoder.decode([Task].self, from: tasksData) {
                tasks = decodedTasks
                recalculateFatigueAtEndOfDay()
                return
            }
            tasks = []
        }
    }
    
    func addTask(task: Task) {
        tasks.append(task)
        saveTasks()
    }
    
    func removeTask(withId id: Int) {
        tasks.removeAll { $0.id == id }
        saveTasks()
    }
    
    func completeTask(withId id: Int) {
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            let task = tasks[index]
            tasks[index] = Task(id: task.id,
                                name: task.name,
                                description: task.description,
                                date: task.date,
                                isCompleted: true)
            saveTasks()
        }
    }
    
    func getAllTask() -> [Task] {
        return tasks
    }
}

//MARK: Private
private extension TaskManager {
    func saveTasks() {
        if let encoded = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encoded, forKey: Constants.taskKey)
        }
    }
    
    func loadLastCalculationDate() {
        if let date = UserDefaults.standard.object(forKey: Constants.lastCalculationDate) as? Date {
            lastCalculationDate = date
        }
    }
    
    func saveLastCalculationDate() {
        UserDefaults.standard.set(lastCalculationDate, forKey: Constants.lastCalculationDate)
    }
    
    func recalculateFatigueAtEndOfDay() {
        let currentDate = Date()
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: currentDate)
        let yesterday = calendar.date(byAdding: .day, value: -1, to: currentDate)!
        
        loadLastCalculationDate()
         
        guard let lastCalculationDates = lastCalculationDate else {
            self.lastCalculationDate = startOfDay
            return
        }
        
        tasks.filter {
            !$0.isCompleted &&
            $0.date >= lastCalculationDates &&
            $0.date <= startOfDay
        }.forEach {_ in
            decreaseFatigueHandler?()
        }
        
        self.lastCalculationDate = yesterday
    }
}
