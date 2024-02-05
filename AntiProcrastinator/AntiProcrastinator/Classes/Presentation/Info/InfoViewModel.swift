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
        let bind: ([AllElements]) -> Void
    }
    
    struct Output {
        let didSelect: (AllElements) -> ()
    }
    
    func configure(input: Input) -> Output {
        let fatigueLevelsSection = InfoTableSection(title: "Info.FatigueLevels.Text".localized, elements: .fatigueLevels("Info.decriptionFatigueLevels.Text".localized), isExpanded: false)
        let pointsSection = InfoTableSection(title: "Info.Points.Text".localized, elements: .points("Info.descriptionPoints.Text".localized), isExpanded: false)
        let punishmentSection = InfoTableSection(title: "Info.Punishment.Text".localized, elements: .punishment("Info.descriptionPunishment.Text".localized), isExpanded: false)
        
        let allElements: [AllElements] = [
            .imageCell("Info.Image"),
            .sections(fatigueLevelsSection),
            .sections(pointsSection),
            .sections(punishmentSection),
            .buttonCell("Info.Start.Text".localized)
        ]
        
        input.bind(allElements)
        return Output { selected in
        }
    }
}
