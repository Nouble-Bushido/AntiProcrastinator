//
//  MainTableElements.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 30.03.2024.
//

import Foundation

enum MainTableElements {
    case Info(MainInfo)
    case Calendar(Task)
    case Tasks(Task)
}

struct MainInfo {
    let fatiguePoints: Fatigue
    let description: String
    let userName: String
}
