//
//  Balls.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 07.03.2024.
//

import Foundation

struct Fatigue: Codable {
    var value: Int
    var fatigueLevels: Int
    
    enum FatigueLevel: Int {
        case low
        case moderate
        case high
        case veryHigh
        case extreme
    }
    
    var determineFatigueLevel: FatigueLevel {
        switch fatigueLevels {
        case 1:
            return .low
        case 2:
            return .moderate
        case 3:
            return .high
        case 4:
            return .veryHigh
        default:
            return .extreme
        }
    }
}
