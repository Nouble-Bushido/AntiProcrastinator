//
//  TaskPageViewModel.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 22.02.2024.
//

import Foundation

final class TaskPageViewModel {
    enum Route {
        case openTask, closeTask
    }
    
     let task: Task

    init(task: Task) {
        self.task = task
    }
}

//MARK: Public
extension TaskPageViewModel {
    struct Input {
        let route: (Route) -> Void
    }
    
    func configure(input: Input) {
        input.route(makeRoute())
    }
}

// MARK: Private
private extension TaskPageViewModel {
    func makeRoute() -> Route {
        task.isCompleted ? Route.closeTask : Route.openTask
    }
}
