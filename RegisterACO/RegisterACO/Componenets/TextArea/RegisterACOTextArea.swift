//
//  RegisterACOTextArea.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 14/10/22.
//

import UIKit


class RegisterACOTextArea: UIView {
    
    private var placeHolder: String = ""
    
    private lazy var textView: UITextView = {
        let textView = UITextView(frame: .zero)
        textView.textColor = UIColor.theme(.dark75)
        textView.font = UIFont.theme(id: .medium14)
        return textView
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
    }
    
    private func setUpTextViewLayout() {
        self.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        textView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        textView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        textView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
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
            self.layer.borderColor = UIColor.theme(.baseLight20).cgColor
        }
    }
}
