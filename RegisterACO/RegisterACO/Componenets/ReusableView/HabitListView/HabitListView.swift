//
//  HabitListView.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 6/11/22.
//

import UIKit

class HabitListView: UIStackView {
    
    private lazy var image: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.contentMode = .scaleAspectFit
        view.heightAnchor.constraint(equalToConstant: 40).isActive = true
        view.widthAnchor.constraint(equalToConstant: 40).isActive = true
        view.image = UIImage(named: "habitList")?.withRenderingMode(.alwaysTemplate).withTintColor(UIColor.theme(.primary100))
        view.tintColor = UIColor.theme(.primary100)
        return view
    }()
    
    private lazy var imageContainer: UIView = {
        let view = UIView(frame: .zero)
        view.heightAnchor.constraint(equalToConstant: 60).isActive = true
        view.widthAnchor.constraint(equalToConstant: 60).isActive = true
        view.layer.cornerRadius = 16
        view.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        image.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        view.backgroundColor = UIColor.theme(.violte20)
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.theme(id: .medium16)
        label.textColor = UIColor.theme(.dark25)
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.theme(id: .medium12)
        label.textColor = UIColor.theme(.baseLight20)
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.theme(id: .medium12)
        label.textColor = UIColor.theme(.baseLight20)
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        view.distribution = .fill
        view.alignment = .fill
        view.axis = .vertical
        view.spacing = 8
        return view
    }()
    
    private lazy var imageAndLabelsStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [imageContainer, labelsStackView])
        view.distribution = .fill
        view.alignment = .center
        view.axis = .horizontal
        view.spacing = 16
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [imageAndLabelsStackView, dateLabel])
        view.distribution = .fillProportionally
        view.alignment = .center
        view.axis = .horizontal
        view.spacing = 16
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        self.distribution = .fill
        self.alignment = .fill
        self.axis = .horizontal
        self.addArrangedSubview(mainStackView)
    }
    
    func configure(with model: HabitListViewModel) {
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
        dateLabel.text = model.date
    }
}

struct HabitListViewModel {
    let title, subtitle, date: String
}
