//
//  ScreenSize.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 22.01.2024.
//

import UIKit

enum ScreenSize {
    static let bounds: CGRect = (UIScreen.main.bounds)
    static let width: CGFloat = (bounds.width)
    static let height: CGFloat = (bounds.height)
    static let maxLength: CGFloat = (max(width, height))
    static let minLength: CGFloat = (min(width, height))
    
    static let isIphone = UIDevice.current.userInterfaceIdiom == .phone
    static let isIphoneXFamily = (isIphone && maxLength / minLength > 2.0)
}
