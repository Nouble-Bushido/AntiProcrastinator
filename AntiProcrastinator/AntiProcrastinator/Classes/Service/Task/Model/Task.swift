//
//  Task.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 08.02.2024.
//

import Foundation

struct Task: Codable {
    let id: Int
    let name: String
    let description: String
    let date: Date
    let isCompleted: Bool
}
