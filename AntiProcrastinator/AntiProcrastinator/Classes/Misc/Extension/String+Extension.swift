//
//  String+Extension.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 22.01.2024.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
