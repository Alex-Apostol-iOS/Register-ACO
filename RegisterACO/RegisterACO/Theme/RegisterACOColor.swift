//
//  RegisterACOColor.swift
//  RegisterACO
//
//  Created by Alex Apostol on 15/4/22.
//

import UIKit

extension UIColor {
    enum RegisterACOColor {
        case primary100
        case primary50
        case red100
    }
    
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
    
    
    static func theme(_ theme: RegisterACOColor) -> UIColor {
        switch theme {
        case .primary100:
            return UIColor(hexString: "#7F3DFF")
        case .primary50:
            return UIColor(hexString: "#EEE5FF")
        case .red100:
            return UIColor(hexString: "#FD3C4A")
        }
    }
}
