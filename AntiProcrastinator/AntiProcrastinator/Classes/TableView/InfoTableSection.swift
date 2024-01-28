//
//  InfoTableSection.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 25.01.2024.
//

import Foundation

struct InfoTableSection {
    let title: String
    let elements: InfoTableElement
    var isExpanded: Bool
}

enum InfoTableElement {
    case fatigueLevels(String)
    case points(String)
    case punishment(String)
}
