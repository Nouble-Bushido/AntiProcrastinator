//
//  Balls.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 07.03.2024.
//

import Foundation

struct Fatigue: Codable {
    var value: Int
    
    enum FatigueLevel {
        case low
        case moderate
        case high
        case veryHigh
        case extreme
    }
    
    var level: FatigueLevel {
         switch value {
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
}
