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
    
    private var fatigue: Fatigue = Fatigue(value: 0)
    
    private init() {}
}

//MARK: Public
extension FatigueManager {
    func configure() {
          if let fatiguePointsData = UserDefaults.standard.data(forKey: Constants.fatiguePointsKey) {
              let decoder = JSONDecoder()
              if let decodedFatiguePoints = try? decoder.decode(Fatigue.self, from: fatiguePointsData) {
                  fatigue = decodedFatiguePoints
                  return
              }
          }
        fatigue = Fatigue(value: 0)
      }

    func increaseFatigueForCompletedTask() {
        adjustFatiguePoints(by: 10)
    }
    
    func decreaseFatigueRemovedTask() {
        adjustFatiguePoints(by: -10)
    }
    
    func getAllFatuguePoints() -> Fatigue {
        return fatigue
    }
    
    func getFatigueLevel() -> Fatigue.FatigueLevel {
        return fatigue.level
    }
}

//MARK: Private
private extension FatigueManager {
    func adjustFatiguePoints(by amount: Int) {
        fatigue.value += amount
        saveFatiguePoints()
    }
    
    func saveFatiguePoints() {
        if let encoded = try? JSONEncoder().encode(fatigue) {
            UserDefaults.standard.set(encoded, forKey: Constants.fatiguePointsKey)
        }
    }
}
