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
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                self.alpha = 1.0
            } else {
                self.alpha = 0.5
            }
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private var buttonAction: (() -> Void)?
    
    func config(buttonStyle: ButtonStyle, title: String, action: @escaping() -> Void) {
        self.buttonAction = action
        self.addTarget(self, action: #selector(didPressButton), for: .touchUpInside)
        let attributeString = NSAttributedString(string: title, attributes: [NSAttributedString.Key.font : UIFont.theme(id: .regular18), NSAttributedString.Key.foregroundColor: getButtonTitleColor(buttonStyle: buttonStyle)])
        DispatchQueue.main.async {
            self.setAttributedTitle(attributeString, for: .normal)
        }
        setUpStyle(buttonStyle: buttonStyle)
    }
    
    fileprivate func setUpStyle(buttonStyle: ButtonStyle) {
        self.layer.cornerRadius = 16
        self.heightAnchor.constraint(equalToConstant: 56).isActive = true
        self.widthAnchor.constraint(equalToConstant: 353).isActive = true
        switch buttonStyle {
        case .primary:
            self.backgroundColor = UIColor.theme(.primary100)
        case .negativeAction:
            self.backgroundColor = UIColor.theme(.red100)
        case .secondary:
            self.backgroundColor = UIColor.theme(.primary50)
        case .positiveAction:
            self.backgroundColor = UIColor.theme(.green100)
        }
    }
    
    fileprivate func getButtonTitleColor(buttonStyle: ButtonStyle) -> UIColor {
        switch buttonStyle {
        case .primary:
           return  UIColor.white
        case .negativeAction:
            return UIColor.white
        case .secondary:
            return UIColor.theme(.primary100)
        case .positiveAction:
            return UIColor.white
        }
    }
    
    @objc
    private func didPressButton() {
        if let buttonAction = buttonAction {
            buttonAction()
        }
    }
}

enum ButtonStyle {
    case primary
    case negativeAction
    case secondary
    case positiveAction
    
}
