//
//  RegisterACONoDataView.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 12/11/22.
//

import UIKit

class RegisterACONoDataView: UIStackView {
    
    private lazy var image: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.contentMode = .scaleAspectFit
        view.heightAnchor.constraint(equalToConstant: 80).isActive = true
        view.widthAnchor.constraint(equalToConstant: 80).isActive = true
        view.image = UIImage(named: "habitList")?.withRenderingMode(.alwaysTemplate).withTintColor(UIColor.theme(.primary100))
        view.tintColor = UIColor.theme(.primary100)
        return view
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.theme(id: .medium16)
        label.textColor = UIColor.theme(.baseLight20)
        return label
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func configure(text: String) {
        infoLabel.text = text
    }
    
    private func commonInit() {
        self.axis = .vertical
        self.distribution = .fill
        self.alignment = .center
        self.spacing = 32
        
        self.addArrangedSubview(image)
        self.addArrangedSubview(infoLabel)
    }
}
