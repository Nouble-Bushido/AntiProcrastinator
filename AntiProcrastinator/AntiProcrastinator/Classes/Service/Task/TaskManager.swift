//
//  TaskManager.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 08.02.2024.
//

import Foundation

final class TaskManager {
    enum Constants {
        static let taskKey = "task_manager_task_key"
        static let lastCalculationDate = "task_manager_last_recalculation_date_key"
    }
}

//MARK: Public
extension TaskManager {
    static func configure() {
        let taskManager = TaskManager()
        taskManager.recalculateFatigueAtEndOfDay()
    }
    
    func addTask(task: Task) {
        var tasks = getAllTask()
        tasks.append(task)
        saveTasks(tasks)
    }
    
    func removeTask(withId id: Int) {
        var tasks = getAllTask()
        tasks.removeAll { $0.id == id }
        saveTasks(tasks)
    }
    
    func completeTask(withId id: Int) {
        var tasks = getAllTask()
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            let task = tasks[index]
            tasks[index] = Task(id: task.id,
                                name: task.name,
                                description: task.description,
                                date: task.date,
                                isCompleted: true)
            saveTasks(tasks)
        }
    }
    
    func getAllTask() -> [Task] {
        let tasks = loadTasks()
        return tasks
    }
}

//MARK: Private
private extension TaskManager {
    func saveTasks(_ tasks: [Task]) {
        guard let encoded = try? JSONEncoder().encode(tasks) else {
            return
        }
        UserDefaults.standard.set(encoded, forKey: Constants.taskKey)
    }
    
    func loadTasks() -> [Task] {
        guard let tasksData = UserDefaults.standard.data(forKey: Constants.taskKey),
              let decodedTasks = try? JSONDecoder().decode([Task].self, from: tasksData) else {
            return []
        }
        return decodedTasks
    }
    
    func recalculateFatigueAtEndOfDay() {
        let currentDate = Date()
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: currentDate)
        let yesterday = calendar.date(byAdding: .day, value: -1, to: currentDate)!
        let tasks = getAllTask()
        let fatigueManager = FatigueManager()
        
        guard let lastCalculationDate = UserDefaults.standard.object(forKey: Constants.lastCalculationDate) as? Date else {
            UserDefaults.standard.set(startOfDay, forKey: Constants.lastCalculationDate)
            return
        }
        
        tasks.filter {
            !$0.isCompleted &&
            $0.date > lastCalculationDate &&
            $0.date <= startOfDay
        }.forEach {_ in
            fatigueManager.decreaseFatigueRemovedTask()
        }
        
        UserDefaults.standard.set(yesterday, forKey: Constants.lastCalculationDate)
    }
}
