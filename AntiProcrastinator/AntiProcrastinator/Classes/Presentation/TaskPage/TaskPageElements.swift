//
//  TaskPageElements.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 28.02.2024.
//

import UIKit

enum TaskPageElements {
    case image(TaskStatus)
    case details(Task, TaskStatus)
    case buttons
}

enum TaskStatus {
    case open(UIImage, String)
    case completed(UIImage, String)
}
