//
//  AllElements.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 25.01.2024.
//

import Foundation

enum AllElements {
    case imageCell(String)
    case sections(InfoTableSection)
    case buttonCell(String)
}

struct InfoTableSection {
    let title: String
    let elements: TypeSections
    var isExpanded: Bool
}

enum TypeSections {
    case fatigueLevels(String)
    case points(String)
    case punishment(String)
}
