//
//  RegisterACOProgressBar.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 23/10/22.
//

import UIKit

class RegisterACOProgressView: UIProgressView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        self.progressTintColor = UIColor.theme(.primary100)
        self.tintColor = UIColor.theme(.baseLight20)
        self.heightAnchor.constraint(equalToConstant: 8).isActive = true
        self.layer.cornerRadius = 4
        self.layer.masksToBounds = true
    }
}
