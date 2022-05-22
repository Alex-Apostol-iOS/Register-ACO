//
//  HomeListUserTableViewCell.swift
//  RegisterACO
//
//  Created by Alex Apostol on 8/5/22.
//

import UIKit
import SDWebImage

class HomeListUserTableViewCell: UITableViewCell {
    
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
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.theme(id: .medium14)
        label.textColor = UIColor.theme(.dark50)
        return label
    }()
    
    private lazy var lastSeenLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.theme(id: .medium14)
        label.textColor = UIColor.theme(.baseLight20)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let  topSpaceView = FreeSpaceView()
        topSpaceView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        let stackView = UIStackView(arrangedSubviews: [topSpaceView, nameLabel, lastSeenLabel, FreeSpaceView()])
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var mainsStackview: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageContainter, labelsStackView, FreeSpaceView()])
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.spacing = 24
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        mainsStackview.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(mainsStackview)
        mainsStackview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        mainsStackview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        mainsStackview.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        mainsStackview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24).isActive = true
    }
    
    func configure(with model: HomeListCellModel) {
        nameLabel.text = model.name
        lastSeenLabel.text = model.lastseen
        userImage.sd_setImage(with: URL(string: model.imageURl ?? ""), placeholderImage: UIImage(named: "avatar_001"))
    }
}

struct HomeListCellModel {
    let name: String
    let lastseen: String
    let imageURl: String?
}
