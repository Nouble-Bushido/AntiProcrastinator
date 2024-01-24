//
//  PaddingLabel.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 24.01.2024.
//

import UIKit

class PaddingLabel: UILabel {
    var paddingLeft: CGFloat = 20.scale
    var paddingRight: CGFloat = 25.scale

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: 0, left: paddingLeft, bottom: 0, right: paddingRight)
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.width += paddingLeft
        return contentSize
    }
}
