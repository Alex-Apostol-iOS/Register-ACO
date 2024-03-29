//
//  StarterViewController.swift
//  RegisterACO
//
//  Created by Alex Apostol on 14/4/22.
//  
//

import UIKit

class StarterViewController: RegisterAcoNavigationController {
    
    private let presenter: StarterPresenterProtocol
    
    private lazy var sellerButton: RegisterACOButton = {
        let button = RegisterACOButton(frame: .zero)
        button.config(buttonStyle: .primary, title: presenter.getlabelForKey(key: "lng.seller"), action: didPressSellerButton)
        return button
    }()
    
    private lazy var distributorButton: RegisterACOButton = {
        let button = RegisterACOButton(frame: .zero)
        button.config(buttonStyle: .primary, title: presenter.getlabelForKey(key: "lng.distribuitor"), action: didPressDistributorButton)
        return button
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [sellerButton, distributorButton])
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
        
    init (presenter: StarterPresenterProtocol) {
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func setUpMainStackViewLayout()  {
        view.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func didPressSellerButton() {
        presenter.didTapUserButton(type: .seller)
    }
    
    private func didPressDistributorButton() {
        presenter.didTapUserButton(type: .distribuitor)
    }
    
}

extension StarterViewController: StarterViewProtocol{
    // TODO: Implement View Output Methods
}
