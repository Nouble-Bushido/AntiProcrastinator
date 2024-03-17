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
    private var fatigueLevel: FatiguePoints.FatigueLevel = .low
    
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
        adjustFatiguePoints(by: 10)
    }
    
    func decreaseFatigueRemovedTask() {
        adjustFatiguePoints(by: -10)
    }
    
    func getAllFatuguePoints() -> FatiguePoints {
        checkAndUpdateFatigueLevel()
        return fatiguePoints
    }
    
    func getFatigueLevel() -> FatiguePoints.FatigueLevel {
        return fatigueLevel
    }
}

//MARK: Private
private extension FatigueManager {
    func adjustFatiguePoints(by amount: Int) {
        fatiguePoints.value += amount
        saveFatiguePoints()
    }
    
    func saveFatiguePoints() {
        if let encoded = try? JSONEncoder().encode(fatiguePoints) {
            UserDefaults.standard.set(encoded, forKey: Constants.fatiguePointsKey)
        }
    }
    
    func calculateFatigueLevel() -> FatiguePoints.FatigueLevel {
        switch fatiguePoints.value {
        case ..<50:
            return .low
        case 50..<100:
            return .moderate
        case 100..<150:
            return .high
        case 150..<200:
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
