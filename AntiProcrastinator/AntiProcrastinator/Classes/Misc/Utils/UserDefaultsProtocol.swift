//
//  UserDefaultsProtocol.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 27.06.2024.
//

import Foundation

protocol UserDefaultsImpl {
    func integer(forKey: String) -> Int
    func set(_ value: Int, forKey: String)
    func removeObject(forKey: String)
}

extension UserDefaults: UserDefaultsImpl { }

final class UserDefaultsMock: UserDefaultsImpl {
    private var storage: [String: Int] = [:]

    func integer(forKey defaultName: String) -> Int {
        return storage[defaultName] ?? 0
    }

    func set(_ value: Int, forKey defaultName: String) {
        storage[defaultName] = value
    }

    func removeObject(forKey defaultName: String) {
        storage.removeValue(forKey: defaultName)
    }
}
