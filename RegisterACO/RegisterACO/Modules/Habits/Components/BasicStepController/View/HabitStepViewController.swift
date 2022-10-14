//
//  HabitStepViewController.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 12/10/22.
//  
//

import UIKit

class HabitStepViewController: RegisterAcoNavigationController {
    
    private let presenter: HabitStepPresenterProtocol
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.theme(id: .semiBold24)
        label.textColor = UIColor.theme(.dark100)
        label.numberOfLines = 2
        label.text = "TEST TILE"
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.theme(id: .medium16)
        label.textColor = UIColor.theme(.dark75)
        label.numberOfLines = 0
        label.text = "Tests description, ests description ests description ests description ests description ests description ests description ests description ests description ests description"
        return label
    }()
    
    private lazy var textView: RegisterACOTextArea = {
        let textArea = RegisterACOTextArea(frame: .zero)
        textArea.configure(placeHolder: "test placeHolder", shouldGrow: true)
        textArea.heightAnchor.constraint(greaterThanOrEqualToConstant: 96).isActive = true
        return textArea
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel, textView, FreeSpaceView()])
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 24
        return stackView
    }()
        
    init (presenter: HabitStepPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMainStackViewLayout()
    }
    
    private func setUpMainStackViewLayout() {
        view.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 18).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
    
}

extension HabitStepViewController: HabitStepViewProtocol{
    // TODO: Implement View Output Methods
}
