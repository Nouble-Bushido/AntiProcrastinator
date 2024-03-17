//
//  Balls.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 07.03.2024.
//

import Foundation

struct FatiguePoints: Codable {
    var value: Int
    
    enum FatigueLevel {
        case low
        case moderate
        case high
        case veryHigh
        case extreme
    }
}
