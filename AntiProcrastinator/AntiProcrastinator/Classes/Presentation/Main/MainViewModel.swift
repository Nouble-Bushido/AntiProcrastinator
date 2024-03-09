//
//  MainViewModel.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 22.02.2024.
//

import Foundation

final class MainViewModel {
   private let userManager = UserManager()
}

//MARK: Public
extension MainViewModel {
    struct Output {
        let tasks: [Task]
        let fatiguePoints: FatiguePoints
        let fatigueLevel: FatigueLevel
        let name: String
    }
    
    func configure() -> Output {
        let tasks = TaskManager.shared.getAllTask()
        let fatiguePoints = FatigueManager.shared.getAllFatuguePoints()
        let fatigueLevel = FatigueManager.shared.getFatigueLevel()
        let name = userManager.getUser()?.name ?? ""
    
        return Output(tasks: tasks, fatiguePoints: fatiguePoints, fatigueLevel: fatigueLevel, name: name)
    }
}
