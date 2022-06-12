//
//  FeatureCardItem.swift
//  RegisterACO
//
//  Created by Alex Apostol on 11/6/22.
//

import Foundation
import UIKit
import SDWebImage

class FeatureCardItem: UIView {
    
    private var gradientColors: [UIColor] = []
    private var gradientCornerRadius: CGFloat = 16
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.theme(id: .bold18)
        label.textColor = .white
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.theme(id: .bold14)
        label.textColor = .white
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var labelsStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel, FreeSpaceView()])
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var mainStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [labelsStackView, FreeSpaceView()])
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.spacing = 16
        return stackView
    }()
    
    private lazy var mainImage: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
        imageview.clipsToBounds = true
        imageview.layer.cornerRadius = 16
        return imageview
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func configure(imageUrl: String = "", title: String, subtitle: String, gradientColors: [UIColor], gradientRadius: CGFloat = 0) {
        mainImage.loadImage(imageUrl: imageUrl, placeHolder: nil)
        mainImage.isHidden = imageUrl.isEmpty
        titleLabel.text = title
        subTitleLabel.text = subtitle
        self.heightAnchor.constraint(equalToConstant: 120).isActive = true
        self.gradientColors = gradientColors
        self.gradientCornerRadius = gradientRadius
    }
    
    private func commonInit() {
        self.layer.cornerRadius = 16
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.theme(.baseLight20).cgColor
        setUpMainStackViewLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        mainImage.setUpHorizontalGradient(colors: gradientColors,  cornerRadius: gradientCornerRadius)
    }
    
    private func setUpMainStackViewLayout() {
        
        addSubview(mainImage)
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        mainImage.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        mainImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        mainImage.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        mainImage.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        
        addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints  = false
        mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        mainStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
    }
}

extension FeatureCardItem {
    func setUpFeatureCardGradientBackground(colors: CGColor...) {
        
    }
}

