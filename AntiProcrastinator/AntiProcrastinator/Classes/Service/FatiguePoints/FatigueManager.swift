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
    
    private var fatiguePoints: FatiguePoints = FatiguePoints(value: 0)
    private var fatigueLevel: FatigueLevel = .low
    
    private init() {}
}

//MARK: Public
extension FatigueManager {
    func configure() {
          if let fatiguePointsData = UserDefaults.standard.data(forKey: Constants.fatiguePointsKey) {
              let decoder = JSONDecoder()
              if let decodedFatiguePoints = try? decoder.decode(FatiguePoints.self, from: fatiguePointsData) {
                  fatiguePoints = decodedFatiguePoints
                  return
              }
          }
        fatiguePoints = FatiguePoints(value: 0)
      }

    func increaseFatigueForCompletedTask() {
        fatiguePoints.value += 10
        saveFatiguePoints()
    }
    
    func decreaseFatigueUncompletedTask() {
        fatiguePoints.value -= 10
        saveFatiguePoints()
    }
    
    func getAllFatuguePoints() -> FatiguePoints {
        checkAndUpdateFatigueLevel()
        return fatiguePoints
    }
    
    func getFatigueLevel() -> FatigueLevel {
        return fatigueLevel
    }
}

//MARK: Private
private extension FatigueManager {
    func saveFatiguePoints() {
        if let encoded = try? JSONEncoder().encode(fatiguePoints) {
            UserDefaults.standard.set(encoded, forKey: Constants.fatiguePointsKey)
        }
    }
    
    func calculateFatigueLevel() -> FatigueLevel {
        switch fatiguePoints.value {
        case ..<50:
            return .low
        case 50..<100:
            return .low
        case 100..<150:
            return .moderate
        case 150..<200:
            return .high
        case 200..<250:
            return .veryHigh
        default:
            return .extreme
        }
    }
    
    func checkAndUpdateFatigueLevel() {
        let newLevel = calculateFatigueLevel()
        if newLevel != fatigueLevel {
            fatigueLevel = newLevel
        }
    }
}
