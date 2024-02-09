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
    struct Input {
        
    }
    
    struct Output {
        let elements: [AddTaskSection]
    }
    
    func configure() -> Output {
        let name = AddTaskSection.taskName("AddTask.TaskName.Text".localized)
        let description = AddTaskSection.description("AddTask.TaskDescription.Text".localized)
        let date = AddTaskSection.date("AddTask.TaskDate.Text".localized)
        let elements: [AddTaskSection] = [name, description, date]
        return Output(elements: elements)
    }
}

//MARK: Private
private extension AddTaskViewModel {
    
}
