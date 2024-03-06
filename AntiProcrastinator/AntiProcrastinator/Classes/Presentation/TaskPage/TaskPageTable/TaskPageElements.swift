//
//  TaskPageElements.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 28.02.2024.
//

import UIKit

enum TaskPageElements {
    case image(TaskRepresentation)
    case details(Task, TaskStatus)
    case buttons
}

struct TaskRepresentation {
    let imageName: String
    let text: String
}

struct TaskStatus {
    let color: UIColor
    let text: String
}
