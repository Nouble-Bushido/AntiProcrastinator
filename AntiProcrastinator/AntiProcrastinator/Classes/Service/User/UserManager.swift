//
//  UserManager.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 22.01.2024.
//

import Foundation

final class UserManager {
    enum Constants {
        static let user = "user_manager_user_key"
    }
}

//MARK: Public
extension UserManager {
    func getUser() -> User? {
        guard let data = UserDefaults.standard.data(forKey: Constants.user) else {
            return nil
        }
        return try? JSONDecoder().decode(User.self, from: data)
    }
    
    func set(user: User) {
        guard let data = try? JSONEncoder().encode(user) else {
            return
        }
        UserDefaults.standard.set(data, forKey: Constants.user)
    }
}
