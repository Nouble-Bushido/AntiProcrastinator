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
    
    private var fatiguePoints: FatiguePoints
    private var fatigueLevel: FatigueLevel = .low
    
    private init() {
        self.fatiguePoints = FatiguePoints(value: 0)
    }
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
}

//MARK: Private
private extension FatigueManager {
    func saveFatiguePoints() {
        if let encoded = try? JSONEncoder().encode(fatiguePoints) {
            UserDefaults.standard.set(encoded, forKey: Constants.fatiguePointsKey)
            fatigueLevel = calculateFatigueLevel()
        }
    }
    
    func calculateFatigueLevel() -> FatigueLevel {
        switch fatiguePoints.value {
        case ..<0:
            return .low
        case 0..<40:
            return .low
        case 40..<80:
            return .moderate
        case 80..<120:
            return .high
        case 120..<160:
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
