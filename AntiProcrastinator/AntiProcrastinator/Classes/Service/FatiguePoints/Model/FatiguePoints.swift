//
//  Balls.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 07.03.2024.
//

import Foundation

struct FatiguePoints: Codable {
    var value: Int
}

enum FatigueLevel {
    case low
    case moderate
    case high
    case veryHigh
    case extreme
    
    var description: String {
        switch self {
        case .low: return "Low"
        case .moderate: return "Moderate"
        case .high: return "High"
        case .veryHigh: return "Very High"
        case .extreme: return "Extreme"
        }
    }
}
