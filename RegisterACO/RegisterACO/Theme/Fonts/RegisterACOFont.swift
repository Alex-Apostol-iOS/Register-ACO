//
//  RegisterACOFont.swift
//  RegisterACO
//
//  Created by Alex Apostol on 15/4/22.
//

import UIKit

enum RegisterACOFont {
    case bold10
    case bold12
    case bold14
    case bold16
    case bold18
    
    case light10
    case light12
    case light14
    case light16
    case light18
    
    case medium10
    case medium12
    case medium14
    case medium16
    case medium18
    
    case regular10
    case regular12
    case regular14
    case regular16
    case regular18
    
    
    case semiBold10
    case semiBold12
    case semiBold14
    case semiBold16
    case semiBold18
}


extension UIFont {
    
    static func theme(id: RegisterACOFont) -> UIFont {
        switch id {
        case .bold10:
            return UIFont(descriptor: UIFontDescriptor(name: "Inter-Bold", size: 10), size: 10.0)
        case .bold12:
            return UIFont(descriptor: UIFontDescriptor(name: "Inter-Bold", size: 12), size: 12.0)
        case .bold14:
            return UIFont(descriptor: UIFontDescriptor(name: "Inter-Bold", size: 14), size: 14.0)
        case .bold16:
            return UIFont(descriptor: UIFontDescriptor(name: "Inter-Bold", size: 16), size: 16.0)
        case .bold18:
            return UIFont(descriptor: UIFontDescriptor(name: "Inter-Bold", size: 18), size: 18.0)
        case .light10:
            return UIFont(descriptor: UIFontDescriptor(name: "Inter-Light", size: 10), size: 10.0)
        case .light12:
            return UIFont(descriptor: UIFontDescriptor(name: "Inter-Light", size: 12), size: 12.0)
        case .light14:
            return UIFont(descriptor: UIFontDescriptor(name: "Inter-Light", size: 14), size: 14.0)
        case .light16:
            return UIFont(descriptor: UIFontDescriptor(name: "Inter-Light", size: 16), size: 16.0)
        case .light18:
            return UIFont(descriptor: UIFontDescriptor(name: "Inter-Light", size: 18), size: 18.0)
        case .medium10:
            return UIFont(descriptor: UIFontDescriptor(name: "Inter-Medium", size: 10), size: 10.0)
        case .medium12:
            return UIFont(descriptor: UIFontDescriptor(name: "Inter-Medium", size: 12), size: 12.0)
        case .medium14:
            return UIFont(descriptor: UIFontDescriptor(name: "Inter-Medium", size: 14), size: 14.0)
        case .medium16:
            return UIFont(descriptor: UIFontDescriptor(name: "Inter-Medium", size: 16), size: 16.0)
        case .medium18:
            return UIFont(descriptor: UIFontDescriptor(name: "Inter-Medium", size: 18), size: 18.0)
        case .regular10:
            return UIFont(descriptor: UIFontDescriptor(name: "Inter-Regular", size: 10), size: 10.0)
        case .regular12:
            return UIFont(descriptor: UIFontDescriptor(name: "Inter-Regular", size: 12), size: 12.0)
        case .regular14:
            return UIFont(descriptor: UIFontDescriptor(name: "Inter-Regular", size: 14), size: 14.0)
        case .regular16:
            return UIFont(descriptor: UIFontDescriptor(name: "Inter-Regular", size: 16), size: 16.0)
        case .regular18:
            return UIFont(descriptor: UIFontDescriptor(name: "Inter-Regular", size: 18), size: 18.0)
        case .semiBold10:
            return UIFont(descriptor: UIFontDescriptor(name: "Inter-SemiBold", size: 10), size: 10.0)
        case .semiBold12:
            return UIFont(descriptor: UIFontDescriptor(name: "Inter-SemiBold", size: 12), size: 12.0)
        case .semiBold14:
            return UIFont(descriptor: UIFontDescriptor(name: "Inter-SemiBold", size: 14), size: 14.0)
        case .semiBold16:
            return UIFont(descriptor: UIFontDescriptor(name: "Inter-SemiBold", size: 16), size: 16.0)
        case .semiBold18:
            return UIFont(descriptor: UIFontDescriptor(name: "Inter-SemiBold", size: 18), size: 18.0)
        }
    }
}
