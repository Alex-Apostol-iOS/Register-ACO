//
//  PostiveHabitInfoViewViewController.swift
//  RegisterACO
//
//  Created by Alex Apostol on 2/7/22.
//  
//

import UIKit

class PostiveHabitInfoViewViewController: RegisterAcoNavigationController {
    
    private let presenter: PostiveHabitInfoViewPresenterProtocol
    
    private lazy var whatIsAHabitSwichButton: RegisterACOSwitchButton = {
        let switchButton = RegisterACOSwitchButton(frame: .zero)
        return switchButton
    }()
    
    private lazy var whatIsaHabitStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [textView,  FreeSpaceView(), whatIsAHabitSwichButton])
         stackView.distribution = .fill
         stackView.alignment = .fill
         stackView.spacing = 0
         stackView.axis = .horizontal
         return stackView
    }()
    
    private let textView: UITextView = {
        let textView = UITextView(frame: .zero)
        textView.font = UIFont.theme(id: .regular14)
        textView.textColor = UIColor.theme(.dark50)
        textView.isEditable = false
        return textView
    }()
    
    private lazy var mainStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [whatIsaHabitStackView, FreeSpaceView()])
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 16
        stackView.axis = .vertical
        return stackView
    }()
        
    init (presenter: PostiveHabitInfoViewPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpStackViewLayout()
    }
    
    private func setUpStackViewLayout() {
        view.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
    
}

extension PostiveHabitInfoViewViewController: PostiveHabitInfoViewViewProtocol{
    // TODO: Implement View Output Methods
}
