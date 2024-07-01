//
//  DIContainer.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 26.06.2024.
//

import Foundation

protocol DIContainerImpl {
    func register<Service>(type: Service.Type, service: Any)
    func resolve<Service>(type: Service.Type) -> Service
}

final class DIContainer: DIContainerImpl {
    static let shared = DIContainer()
    private var services: [String: Any] = [:]
    
    private init() {}
}

//MARK: Public
extension DIContainer {
    func register<Service>(type: Service.Type, service: Any) {
        services["\(type)"] = service
    }
    
    func resolve<Service>(type: Service.Type) -> Service {
        guard let service = services["\(type)"] as? Service else {
            fatalError("\(type) not found in DI container")
        }
        return service
    }
}
