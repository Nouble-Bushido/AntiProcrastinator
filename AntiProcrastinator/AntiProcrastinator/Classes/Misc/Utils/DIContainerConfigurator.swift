//
//  DIContainerConfigarator.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 04.07.2024.
//

import Foundation

class DIContainerConfigurator {
    static func configure(container: DIContainer) {
        container.register(type: LaunchManagerProtocol.self, service: LaunchManager())
        container.register(type: TaskManagerProtocol.self, service: TaskManager())
        container.register(type: UserManagerProtocol.self, service: UserManager())
        container.register(type: FatigueManagerProtocol.self, service: FatigueManager())
    }
}
