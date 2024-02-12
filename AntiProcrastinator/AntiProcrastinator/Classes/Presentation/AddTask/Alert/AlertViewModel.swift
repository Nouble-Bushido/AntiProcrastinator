//
//  AlertViewModel.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 12.02.2024.
//

import Foundation

final class AlertViewModel {
    private let userManager = UserManager()
}

//MARK: Public
extension AlertViewModel {
    func getUserName() -> String {
        guard let userName = userManager.getUser() else { return "" }
        return userName.name
    }
}
