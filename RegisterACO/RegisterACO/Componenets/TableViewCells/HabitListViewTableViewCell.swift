//
//  HabitListViewTableViewCell.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 6/11/22.
//

import UIKit

class HabitListViewTableViewCell: UITableViewCell {

    static let identifier = String(describing: HabitListViewTableViewCell.self)
    
    private lazy var habitListView: HabitListView = {
        let view = HabitListView(frame: .zero)
        return view
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
        self.selectionStyle = .none
        contentView.addSubview(habitListView)
        habitListView.translatesAutoresizingMaskIntoConstraints = false
        habitListView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        habitListView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        habitListView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32).isActive = true
        habitListView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }
    
    func configure(with model: HabitListViewModel) {
        habitListView.configure(with: model)
    }
}
