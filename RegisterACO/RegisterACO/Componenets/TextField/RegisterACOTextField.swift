//
//  RegisterACOTextField.swift
//  RegisterACO
//
//  Created by Alex Apostol on 24/4/22.
//

import UIKit
import Combine

class RegisterACOTextField: UIStackView {
    
    enum TextFieldType {
        case email
        case password
        case phone
        case number
        case text
    }
    
    private var fieldType: TextFieldType = .text
    
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
    
    var text: String {
        get {
            return textField.text ?? ""
        }
    }
    
    var publisher: AnyPublisher<String, Never> {
        get {
            return textField.textPublisher
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
    
    func configure(placeHolder: String, type: TextFieldType) {
        textField.placeholder = placeHolder
        
        setUp(type: type)
        
    }
    
    private func setUp(type: TextFieldType) {
        textField.clearButtonMode = .whileEditing
        textFieldRightView.setImage(UIImage(systemName: "xmark.circle.fill")?.withRenderingMode(.alwaysTemplate), for: .normal)
        textFieldRightView.imageView?.sizeToFit()
        textFieldRightView.tintColor = UIColor.theme(.baseLight20)
        textField.rightView = textFieldRightView
        textField.rightViewMode = .always
        switch type {
        case .email:
            textFieldRightView.addTarget(self, action: #selector(clearText), for: .touchUpInside)
            textField.textContentType = .emailAddress
        case .password:
            textFieldRightView.setImage(UIImage(systemName: "eye")?.withRenderingMode(.alwaysTemplate), for: .normal)
            textFieldRightView.addTarget(self, action: #selector(toggleHiddenText), for: .touchUpInside)
            textFieldRightView.imageView?.sizeToFit()
            textField.rightView = textFieldRightView
            textField.isSecureTextEntry = true
        case .phone:
            textFieldRightView.addTarget(self, action: #selector(clearText), for: .touchUpInside)
            textField.textContentType = .telephoneNumber
        case .number:
            textFieldRightView.addTarget(self, action: #selector(clearText), for: .touchUpInside)
            textField.keyboardType = .numberPad
        case .text:
            textFieldRightView.addTarget(self, action: #selector(clearText), for: .touchUpInside)
        }
    }
    
    @objc
    private func toggleHiddenText() {
        toggleTextFieldSecureText = !toggleTextFieldSecureText
    }
    
    @objc
    private func clearText() {
        textField.text = nil
        NotificationCenter.default.post(name: UITextField.textDidChangeNotification, object: self.textField)
    }
}
