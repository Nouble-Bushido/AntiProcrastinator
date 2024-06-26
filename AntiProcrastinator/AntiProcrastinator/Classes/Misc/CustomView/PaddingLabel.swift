//
//  PaddingLabel.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 24.01.2024.
//

import UIKit

class PaddingLabel: UILabel {
    var padding: UIEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 25)

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }

    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.width += padding.left
        return contentSize
    }
}
