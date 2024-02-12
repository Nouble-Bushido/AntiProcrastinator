//
//  AddTaskViewModel.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 08.02.2024.
//

import UIKit

final class AddTaskViewModel {
}

//MARK: Public
 extension AddTaskViewModel {
    func saveTask(name: String, description: String, date: Date) {
        let newTask = Task(id: UUID().hashValue, name: name, description: description, date: date, isCompleted: false)
        TaskManager.share.addTask(task: newTask)
    }
}
