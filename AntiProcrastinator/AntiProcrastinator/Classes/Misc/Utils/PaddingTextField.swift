//
//  PaddingTextField.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 16.02.2024.
//

import UIKit

class PaddingTextField: UITextField {
    var paddingLeft: CGFloat = 15.scale
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0,
                                             left: paddingLeft,
                                             bottom: 0,
                                             right: 0))
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0,
                                             left: paddingLeft,
                                             bottom: 0,
                                             right: 0))
    }
}
