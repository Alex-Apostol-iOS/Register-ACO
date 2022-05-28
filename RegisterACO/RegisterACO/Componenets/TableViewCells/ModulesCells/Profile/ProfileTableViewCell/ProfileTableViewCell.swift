//
//  ProfileTableViewCell.swift
//  RegisterACO
//
//  Created by Alex Apostol on 28/5/22.
//

import UIKit
import SDWebImage

class ProfileTableViewCell: UITableViewCell {
    
    private lazy var imageContainer: UIView = {
        let view = UIView(frame: .zero)
        view.heightAnchor.constraint(equalToConstant: 52).isActive = true
        view.widthAnchor.constraint(equalToConstant: 52).isActive = true
        view.layer.cornerRadius = 16
        return  view
    }()
    
    private lazy var cellImage: UIImageView = {
       let view = UIImageView()
        view.heightAnchor.constraint(equalToConstant: 22).isActive = true
        view.widthAnchor.constraint(equalToConstant: 22).isActive = true
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private lazy var cellText: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.theme(id: .medium16)
        label.textColor = UIColor.theme(.dark25)
        return label
    }()
    
    private lazy var mainStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [imageContainer, cellText, FreeSpaceView()])
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.spacing = 4
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
    
    func configure(with model: ProfileTableViewCellModel) {
        cellText.text = model.cellText
        cellImage.sd_setImage(with: URL(string: model.image))
        imageContainer.backgroundColor = model.imageContainerColor
    }
    
    private func commonInit() {
        imageContainer.addSubview(cellImage)
        cellImage.translatesAutoresizingMaskIntoConstraints = false
        cellImage.centerYAnchor.constraint(equalTo: imageContainer.centerYAnchor).isActive = true
        cellImage.centerXAnchor.constraint(equalTo: imageContainer.centerXAnchor).isActive = true
        
        contentView.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        
        self.selectionStyle = .none
    }
}

struct ProfileTableViewCellModel {
    let image: String
    let cellText: String
    let imageContainerColor: UIColor
}
