//
//  Fonts.swift
//  AntiProcrastinator
//
//  Created by Артем Чжен on 22.01.2024.
//

import UIKit

enum Fonts {
    enum Ubuntu {
        static func medium(size: CGFloat) -> UIFont {
            UIFont(name: "Ubuntu-Medium", size: size)!
        }
        
        static func semiBold(size: CGFloat) -> UIFont {
            UIFont(name: "Ubuntu-Light", size: size)!
        }
        
        static func regular(size: CGFloat) -> UIFont {
            UIFont(name: "Ubuntu-Regular", size: size)!
        }
        
        static func bold(size: CGFloat) -> UIFont {
            UIFont(name: "Ubuntu-Bold", size: size)!
        }
    }
}
