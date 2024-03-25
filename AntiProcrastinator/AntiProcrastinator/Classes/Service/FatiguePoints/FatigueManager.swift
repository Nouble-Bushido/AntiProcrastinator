//
//  FatigueManager.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 07.03.2024.
//

import Foundation

final class FatigueManager {
    static let shared = FatigueManager()
    
    enum Constants {
        static let fatiguePointsKey = "fatigue_points_manager_key"
    }
    
    private init() {}
}

//MARK: Public
extension FatigueManager {
    func increaseFatigueForCompletedTask() {
        adjustFatiguePoints(by: 10)
    }
    
    func decreaseFatigueRemovedTask() {
        adjustFatiguePoints(by: -10)
    }
    
    func getAllFatuguePoints() -> Fatigue {
        guard let fatiguePointsData = UserDefaults.standard.data(forKey: Constants.fatiguePointsKey),
              let decodedFatiguePoints = try? JSONDecoder().decode(Fatigue.self, from: fatiguePointsData) else {
            return Fatigue(value: 0)
        }
        return decodedFatiguePoints
    }
}

//MARK: Private
private extension FatigueManager {
    func adjustFatiguePoints(by amount: Int) {
        var fatigue = getAllFatuguePoints()
        fatigue.value += amount
        saveFatiguePoints(fatigue: fatigue)
    }
    
    func saveFatiguePoints(fatigue: Fatigue) {
        if let encoded = try? JSONEncoder().encode(fatigue) {
            UserDefaults.standard.set(encoded, forKey: Constants.fatiguePointsKey)
        }
    }
}
