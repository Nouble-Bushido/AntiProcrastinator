//
//  InfoViewModel.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 25.01.2024.
//

import UIKit

final class InfoViewModel {
    func configure(input: Input) -> Output {
        let fatigueLevelsSection = InfoTableSection(title: "Info.FatigueLevels.Text".localized, elements: .fatigueLevels("Info.decriptionFatigueLevels.Text".localized), isExpanded: false)
        let pointsSection = InfoTableSection(title: "Info.Points.Text".localized, elements: .points("Info.descriptionPoints.Text".localized), isExpanded: false)
        let punishmentSection = InfoTableSection(title: "Info.Punishment.Text".localized, elements: .punishment("Info.descriptionPunishment.Text".localized), isExpanded: false)
        let sections: [InfoTableSection] = [fatigueLevelsSection, pointsSection, punishmentSection]
        input.bind(sections)
        return Output.init { selected in
        }
    }
}

extension InfoViewModel {
    struct Input {
        let bind: ([InfoTableSection]) -> Void
    }
    
    struct Output {
        let didSelect:(InfoTableElement) -> Void
    }
}
