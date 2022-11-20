//
//  StarCarrouselCollectionViewCell.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 20/11/22.
//

import UIKit

class StarCarrouselCollectionViewCell: UICollectionViewCell {
    static let id = String(describing: StarCarrouselCollectionViewCell.self)
    
    private lazy var mainImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.heightAnchor.constraint(equalToConstant: 300).isActive = true
        view.widthAnchor.constraint(equalToConstant: 300).isActive = true
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.font = UIFont.theme(id: .bold32)
        label.textColor = UIColor.theme(.dark50)
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.font = UIFont.theme(id: .medium16)
        label.textColor = UIColor.theme(.baseLight20)
        return label
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel, FreeSpaceView()])
        view.distribution = .fill
        view.alignment = .center
        view.spacing = 16
        view.axis = .vertical
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [mainImage, labelsStackView])
        view.distribution = .fill
        view.alignment = .fill
        view.spacing = 24
        view.axis = .vertical
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func configure(with model: StarCarrouselCollectionViewCellModel) {
        titleLabel.text = model.titleKey.localized
        subTitleLabel.text = model.subtitleKey.localized
        mainImage.image = UIImage(named: model.imageUrl)
    }
    
    private func commonInit() {
        contentView.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}

struct StarCarrouselCollectionViewCellModel {
    let titleKey: String
    let subtitleKey: String
    let imageUrl: String
}
