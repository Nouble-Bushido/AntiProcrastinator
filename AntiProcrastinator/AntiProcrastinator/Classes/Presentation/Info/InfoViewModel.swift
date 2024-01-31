//
//  InfoViewModel.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 25.01.2024.
//

import UIKit

final class InfoViewModel {
}

//MARK: Public
extension InfoViewModel {
    struct Input {
        let bind: ([InfoTableSection]) -> Void
    }
    
    func configure(input: Input) {
        let fatigueLevelsSection = InfoTableSection(title: "Info.FatigueLevels.Text".localized, elements: .fatigueLevels("Info.decriptionFatigueLevels.Text".localized), isExpanded: false)
        let pointsSection = InfoTableSection(title: "Info.Points.Text".localized, elements: .points("Info.descriptionPoints.Text".localized), isExpanded: false)
        let punishmentSection = InfoTableSection(title: "Info.Punishment.Text".localized, elements: .punishment("Info.descriptionPunishment.Text".localized), isExpanded: false)
        let sections: [InfoTableSection] = [fatigueLevelsSection, pointsSection, punishmentSection]
        input.bind(sections)
    }
}
