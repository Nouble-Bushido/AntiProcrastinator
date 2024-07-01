//
//  Coordinator.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 28.06.2024.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}
