//
//  RegisterACOButton.swift
//  RegisterACO
//
//  Created by Alex Apostol on 15/4/22.
//

import UIKit

class RegisterACOButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private var buttonAction: (() -> Void)?
    
    func config(type: ButtonType, action: @escaping() -> Void) {
        self.addTarget(self, action: #selector(didPressButton), for: .touchUpInside)
    }
    
    @objc
    private func didPressButton() {
        if let buttonAction = buttonAction {
            buttonAction()
        }
    }
}

enum ButtonType {
    case primary
    case negativeAction
    
}
