//
//  RegisterUserInfoHeader.swift
//  RegisterACO
//
//  Created by Alex Apostol on 28/5/22.
//

import UIKit

class RegisterUserInfoHeader: UIStackView, GetLabel {
    
    private lazy var userImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.heightAnchor.constraint(equalToConstant: 60).isActive = true
        image.widthAnchor.constraint(equalToConstant: 60).isActive = true
        image.layer.cornerRadius = 30
        return image
    }()
    
    private lazy var imageContainter: UIView = {
        let view = UIView(frame: .zero)
        view.heightAnchor.constraint(equalToConstant: 80).isActive = true
        view.widthAnchor.constraint(equalToConstant: 80).isActive = true
        view.layer.cornerRadius = 40
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.theme(.primary100).cgColor
        
        userImage.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(userImage)
        userImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        userImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        return view
    }()
    
    private lazy var staticUserNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.theme(id: .medium14)
        label.textColor = UIColor.theme(.baseLight20)
        label.text = getlabelForKey(key: "lng.common.username")
        return label
    }()
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.theme(id: .semiBold18)
        label.textColor = UIColor.theme(.dark75)
        label.text = getlabelForKey(key: "lng.common.username")
        return label
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let topspaceView = UIView(frame: .zero)
        topspaceView.heightAnchor.constraint(equalToConstant: 16).isActive = true
        let stackView = UIStackView(arrangedSubviews: [FreeSpaceView(), staticUserNameLabel, userNameLabel, FreeSpaceView()])
        stackView.distribution = .equalCentering
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func configure(with model: RegisterUserInfoHeaderModel) {
        userNameLabel.text = model.username
        userImage.sd_setImage(with: URL(string: model.image), placeholderImage: UIImage(named: "avatar_001"))
        self.layoutSubviews()
    }
    
    private func commonInit() {
        self.distribution = .fill
        self.alignment = .fill
        self.spacing = 12
        self.axis = .horizontal
        self.addArrangedSubview(imageContainter)
        self.addArrangedSubview(labelsStackView)
        self.addArrangedSubview(FreeSpaceView())
    }
}

struct RegisterUserInfoHeaderModel {
    let image: String
    let username: String
}
