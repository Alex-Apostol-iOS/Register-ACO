//
//  RegisterACOSwitchButton.swift
//  RegisterACO
//
//  Created by Alex Apostol on 4/7/22.
//

import UIKit

class RegisterACOSwitchButton: UISwitch {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        onTintColor = UIColor.theme(.primary100)
    }
}
