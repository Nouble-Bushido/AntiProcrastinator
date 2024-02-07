//
//  InfoElements.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 25.01.2024.
//

import Foundation

enum InfoElements {
    case imageCell(String)
    case sections(InfoTableSection)
    case buttonCell(String)
}

struct InfoTableSection {
    let title: String
    let elements: InfoTableSectionType
    var isExpanded: Bool
    var hasSeparator: Bool
}

enum InfoTableSectionType {
    case fatigueLevels(String)
    case points(String)
    case punishment(String)
}
