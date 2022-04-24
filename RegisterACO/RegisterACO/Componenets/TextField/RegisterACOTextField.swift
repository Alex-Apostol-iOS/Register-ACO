//
//  RegisterACOTextField.swift
//  RegisterACO
//
//  Created by Alex Apostol on 24/4/22.
//

import UIKit

class RegisterACOTextField: UIStackView {
    
    private lazy var textField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.font = UIFont.theme(id: .medium16)
        textField.textColor = UIColor.theme(.baseLight20)
        return textField
    }()
    
    private lazy var textFieldRightView: UIButton = {
        let button = UIButton(frame: .zero)
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.widthAnchor.constraint(equalToConstant: 32).isActive = true
        return button
    }()
    
    private var toggleTextFieldSecureText: Bool = false {
        didSet {
            textField.isSecureTextEntry = !textField.isSecureTextEntry
            if toggleTextFieldSecureText {
                textFieldRightView.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            } else {
                textFieldRightView.setImage(UIImage(systemName: "eye"), for: .normal)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        addArrangedSubview(textField)
        self.distribution = .fill
        self.alignment = .fill
        self.axis = .vertical
        self.spacing = 4
        self.layer.cornerRadius = 16
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.theme(.baseLight20).cgColor
        self.isLayoutMarginsRelativeArrangement = true
        self.layoutMargins = UIEdgeInsets(top: 5, left: 16, bottom: 5, right: 5)
    }
    
    func configure(placeHolder: String, isSecureText: Bool = false) {
        textField.placeholder = placeHolder
        textField.isSecureTextEntry = isSecureText
        setUpRightView(isSecureText: isSecureText)
    }
    
    private func setUpRightView(isSecureText: Bool) {
        if isSecureText {
            textFieldRightView.setImage(UIImage(systemName: "eye")?.withRenderingMode(.alwaysTemplate), for: .normal)
            textFieldRightView.addTarget(self, action: #selector(toggleHiddenText), for: .touchUpInside)
            textFieldRightView.imageView?.sizeToFit()
            textFieldRightView.tintColor = UIColor.theme(.baseLight20)
            textField.rightView = textFieldRightView
            textField.rightViewMode = .always
        } else {
            textField.clearButtonMode = .whileEditing
            textFieldRightView.setImage(UIImage(systemName: "xmark.circle.fill")?.withRenderingMode(.alwaysTemplate), for: .normal)
            textFieldRightView.imageView?.sizeToFit()
            textFieldRightView.tintColor = UIColor.theme(.baseLight20)
            textFieldRightView.addTarget(self, action: #selector(clearText), for: .touchUpInside)
            textField.rightView = textFieldRightView
        }
    }
    
    @objc
    private func toggleHiddenText() {
        toggleTextFieldSecureText = !toggleTextFieldSecureText
    }
    
    @objc
    private func clearText() {
        textField.text = nil
    }
}
