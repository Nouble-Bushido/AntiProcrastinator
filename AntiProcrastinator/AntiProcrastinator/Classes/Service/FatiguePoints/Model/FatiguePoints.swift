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
        case .low: return "Main.FatigueLevel.Low.Description.Text".localized
        case .moderate: return "Main.FatigueLevel.Moderate.Description.Text".localized
        case .high: return "Main.FatigueLevel.High.Description.Text".localized
        case .veryHigh: return "Main.FatigueLevel.VeryHigh.Description.Text".localized
        case .extreme: return "Main.FatigueLevel.Extreme.Description.Text".localized
        }
    }
}
