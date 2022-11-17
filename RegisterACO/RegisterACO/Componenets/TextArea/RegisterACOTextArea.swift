//
//  RegisterACOTextArea.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 14/10/22.
//

import UIKit
import Combine


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
    
    private lazy var placeHolderLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor.theme(.baseLight20)
        label.font = UIFont.theme(id: .medium14)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var textView: UITextView = {
        let textView = UITextView(frame: .zero)
        textView.textColor = UIColor.theme(.dark75)
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
    
    var publisher: AnyPublisher<String, Never> {
        get {
            return textView.textPublisher
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        styleConfig()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        styleConfig()
    }
    
    func configure(placeHolder: String, shouldGrow: Bool)  {
        placeHolderLabel.text = placeHolder
        self.placeHolder = placeHolder
        textView.isScrollEnabled = shouldGrow
    }
    
    private func styleConfig() {
        self.layer.borderColor = UIColor.theme(.baseLight20).cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 8
        setUpTextViewLayout()
        setUpClearIconLayout()
        setUpPlaceHolderLayout()
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
    
    private func setUpPlaceHolderLayout() {
        self.addSubview(placeHolderLabel)
        placeHolderLabel.translatesAutoresizingMaskIntoConstraints = false
        placeHolderLabel.leadingAnchor.constraint(equalTo: textViewStackView.leadingAnchor, constant: 16).isActive = true
        placeHolderLabel.topAnchor.constraint(equalTo: textViewStackView.topAnchor, constant: 16).isActive = true
        placeHolderLabel.trailingAnchor.constraint(equalTo: clearIcon.leadingAnchor, constant: -16).isActive = true
    }
    

    @objc
    private func didTapClearIcon() {
        textView.text = ""
        textView.delegate?.textViewDidEndEditing?(textView)
        textView.delegate?.textViewDidChange?(textView)
        textView.resignFirstResponder()
        placeHolderLabel.isHidden = false
        textView.textContainer.didChangeValue(forKey: UITextView.textDidChangeNotification.rawValue)
    }
    
    var text: String {
        return textView.text
    }
    
}

extension RegisterACOTextArea: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = nil
            placeHolderLabel.isHidden = true
        }
        self.layer.borderColor = UIColor.theme(.primary100).cgColor
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            placeHolderLabel.isHidden = false
        }
        self.layer.borderColor = UIColor.theme(.baseLight20).cgColor
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        if textView.text == "" {
        self.placeHolderLabel.isHidden = true
        }
        return true
    }
}
