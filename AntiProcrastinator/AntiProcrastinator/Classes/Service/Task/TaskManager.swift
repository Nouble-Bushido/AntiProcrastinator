//
//  TaskManager.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 08.02.2024.
//

import Foundation

final class TaskManager {
    static let shared = TaskManager()
    
    enum Constants {
        static let taskKey = "task_manager_task_key"
        static let subtractedTaskIdsKey = "task_manager_subtracted_task_ids_key"
    }
    
    private var tasks: [Task] = []
    private var subtractedTaskIdsForToday: Set<Int> = []
    
    private init() {}
}

//MARK: Public
extension TaskManager {
    func configure() {
        if let tasksData = UserDefaults.standard.data(forKey: Constants.taskKey) {
            let decoder = JSONDecoder()
            if let decodedTasks = try? decoder.decode([Task].self, from: tasksData) {
                tasks = decodedTasks
                return
            }
        }
        tasks = []
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
    
    func recalculateFatiguePointsAtEndOfDay(tasks: [Task]) {
        let currentDate = Date()
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: currentDate)
        let yesterday = calendar.date(byAdding: .day, value: -1, to: currentDate)!
        let startYesterday = calendar.startOfDay(for: yesterday)
        
        loadSubtractedTaskIdsForToday()
        
        tasks.filter {
            !$0.isCompleted &&
            $0.date >= startYesterday &&
            $0.date <= startOfDay &&
            !subtractedTaskIdsForToday.contains($0.id)
        }.forEach {
            FatigueManager.shared.decreaseFatigueRemovedTask()
            subtractedTaskIdsForToday.insert($0.id)
        }
        
        saveSubtractedTaskIdsForToday()
    }
}

//MARK: Private
private extension TaskManager {
    func saveTasks() {
        if let encoded = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encoded, forKey: Constants.taskKey)
        }
    }
    
    private func loadSubtractedTaskIdsForToday() {
        if let data = UserDefaults.standard.data(forKey: Constants.subtractedTaskIdsKey),
           let ids = try? JSONDecoder().decode(Set<Int>.self, from: data) {
            subtractedTaskIdsForToday = ids
        }
    }
    
    private func saveSubtractedTaskIdsForToday() {
        if let encoded = try? JSONEncoder().encode(subtractedTaskIdsForToday) {
            UserDefaults.standard.set(encoded, forKey: Constants.subtractedTaskIdsKey)
        }
    }
}
