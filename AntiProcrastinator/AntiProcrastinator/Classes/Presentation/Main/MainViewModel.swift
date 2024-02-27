//
//  MainViewModel.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 22.02.2024.
//

import Foundation

final class MainViewModel {
}

//MARK: Public
extension MainViewModel {
    struct Output {
        let tasks: [Task]
    }
    
    func configure() -> Output {
        let tasks : [Task] = TaskManager.share.getAllTask()
        return Output(tasks: tasks)
    }
}
