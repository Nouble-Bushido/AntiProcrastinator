//
//  TaskManager.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 08.02.2024.
//

import Foundation

final class TaskManager {
    static let share = TaskManager()
    
    enum Constants {
        static let taskKey = "task_manager_task_key"
    }
    
    private var tasks: [Task] = []
    
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
}

//MARK: Private
private extension TaskManager {
    func saveTasks() {
        if let encoded = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encoded, forKey: Constants.taskKey)
        }
    }
}
