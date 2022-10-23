//
//  RegisterACOTextArea.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 14/10/22.
//

import UIKit


class RegisterACOTextArea: UIView {
    
    private var placeHolder: String = ""
    
    private lazy var clearIcon: UIButton = {
        let imageView = UIButton(frame: .zero)
        imageView.setImage(UIImage(named: "cross")?.withRenderingMode(.alwaysTemplate), for: .normal)
        imageView.tintColor = UIColor.theme(.baseLight20)
        imageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.contentMode = .scaleAspectFit
        imageView.addTarget(self, action: #selector(didTapClearIcon), for: .touchUpInside)
        return imageView
    }()
    
    private lazy var textView: UITextView = {
        let textView = UITextView(frame: .zero)
        textView.textColor = UIColor.theme(.dark50)
        textView.font = UIFont.theme(id: .medium14)
        textView.delegate = self
        return textView
    }()
    
    private lazy var textViewStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [textView])
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 0
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        styleConfig()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        styleConfig()
    }
    
    func configure(placeHolder: String, shouldGrow: Bool)  {
        textView.text = placeHolder
        textView.textColor = UIColor.theme(.baseLight20)
        self.placeHolder = placeHolder
        textView.isScrollEnabled = shouldGrow
    }
    
    private func styleConfig() {
        self.layer.borderColor = UIColor.theme(.baseLight20).cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 8
        setUpTextViewLayout()
        setUpClearIconLayout()
    }
    
    private func setUpTextViewLayout() {
        self.addSubview(textViewStackView)
        textViewStackView.translatesAutoresizingMaskIntoConstraints = false
        textViewStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        textViewStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        textViewStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        textViewStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        textView.textContainerInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 32)
    }
    
    private func setUpClearIconLayout() {
        self.addSubview(clearIcon)
        clearIcon.translatesAutoresizingMaskIntoConstraints = false
        clearIcon.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        clearIcon.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
    }
    
    
    
    @objc
    private func didTapClearIcon() {
        textView.text = ""
        textView.resignFirstResponder()
    }
    
}

extension RegisterACOTextArea: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.theme(.baseLight20) {
            textView.text = nil
            textView.textColor = UIColor.theme(.dark75)
            self.layer.borderColor = UIColor.theme(.primary100).cgColor
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeHolder
            textView.textColor = UIColor.theme(.baseLight20)
        }
        self.layer.borderColor = UIColor.theme(.baseLight20).cgColor
    }
}
