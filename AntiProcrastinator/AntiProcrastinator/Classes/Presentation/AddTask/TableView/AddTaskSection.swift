//
//  AddTaskElements.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 08.02.2024.
//

import Foundation

//struct AddTaskSection {
//    let title: (String)
//    let elements: [AddTaskElement]
//}

enum AddTaskSection {
    case taskName(String)
    case description(String)
    case date(String)
}

struct Elements {
    let title: String
    let description: String
}
