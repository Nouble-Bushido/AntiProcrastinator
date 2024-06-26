//
//  FatigueManager.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 07.03.2024.
//

import Foundation

final class FatigueManager {
    enum Constants {
        static let fatiguePointsKey = "fatigue_points_manager_key"
        static let fatigueThreshold = 200
    }
}

//MARK: Public
extension FatigueManager {
    func increaseFatigueForCompletedTask() {
        adjustFatiguePoints(by: 50)
        checkAndIncreaseFatigueLevel()
    }
    
    func decreaseFatigueRemovedTask() {
        adjustFatiguePoints(by: -50)
        checkAndIncreaseFatigueLevel()
    }
    
    func getAllFatuguePoints() -> Fatigue {
        guard let fatiguePointsData = UserDefaults.standard.data(forKey: Constants.fatiguePointsKey),
              let decodedFatiguePoints = try? JSONDecoder().decode(Fatigue.self, from: fatiguePointsData) else {
            return Fatigue(value: 0, fatigueLevels: 1)
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
        guard let encoded = try? JSONEncoder().encode(fatigue) else {
            return
        }
        UserDefaults.standard.setValue(encoded, forKey: Constants.fatiguePointsKey)
    }
    
    func checkAndIncreaseFatigueLevel() {
        var fatigue = getAllFatuguePoints()
        
        switch fatigue.value {
        case let value where value >= Constants.fatigueThreshold:
            if fatigue.fatigueLevels < 5 {
                fatigue.value = 0
                fatigue.fatigueLevels += 1
            } else {
                fatigue.value = Constants.fatigueThreshold
            }
        case let value where value < 0:
            if fatigue.fatigueLevels > 1 {
                fatigue.fatigueLevels -= 1
                fatigue.value = Constants.fatigueThreshold - 50
            } else {
                fatigue.value = 0
            }
        default:
            break
        }
        saveFatiguePoints(fatigue: fatigue)
    }
}
