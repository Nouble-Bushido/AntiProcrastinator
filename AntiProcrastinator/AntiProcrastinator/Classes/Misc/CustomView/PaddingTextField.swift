//
//  PaddingTextField.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 16.02.2024.
//

import UIKit

class PaddingTextField: UITextField {
    var padding: UIEdgeInsets = UIEdgeInsets(top: 0, left: 15.scale, bottom: 0, right: 0)
    var placeholderPadding: UIEdgeInsets = UIEdgeInsets(top: 0, left: 15.scale, bottom: 0, right: 0)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: placeholderPadding)
    }
}
