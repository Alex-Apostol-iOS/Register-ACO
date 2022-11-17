//
//  BasicDetailViewController.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 19/10/22.
//

import UIKit
import SDWebImage

class BasicDetailViewController: UIViewController, ModalAlerViewControllerProtocol {
    
    let dataModel: BasicDetailViewDataModel
    
    private lazy var scrollView: UIScrollView = {
       let scroll = UIScrollView()
        scroll.backgroundColor = .clear
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.showsVerticalScrollIndicator = false
        scroll.backgroundColor = UIColor.white
        return scroll
    }()
    
    private lazy var customContentView: UIView = {
       let content = UIView()
        content.backgroundColor = UIColor.white
        content.translatesAutoresizingMaskIntoConstraints = false
        return content
    }()
    
    private lazy var closeIcon: UIButton = {
        let imageView = UIButton(frame: .zero)
        imageView.setImage(UIImage(named: "cross")?.withRenderingMode(.alwaysTemplate), for: .normal)
        imageView.tintColor = UIColor.theme(.baseLight20)
        imageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.contentMode = .scaleAspectFit
        imageView.addTarget(self, action: #selector(didTapCloseIcon), for: .touchUpInside)
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.theme(id: .semiBold18)
        label.textColor = UIColor.theme(.dark100)
        label.numberOfLines = 2
        label.text = dataModel.titleKey.localized
        return label
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 16
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var button: RegisterACOButton = {
        let button = RegisterACOButton(frame: .zero)
        button.isHidden = dataModel.shouldHideButton
        button.config(buttonStyle:dataModel.buttonStyle , title: dataModel.buttonTitle?.localized ?? "", action: didTapButton)
        return button
    }()
    
    init(dataModel: BasicDetailViewDataModel) {
        self.dataModel = dataModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("coder init not implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpScrollViewLayout()
        setUpContentViewLayout()
        setUpCloseIconLayout()
        setUpTitleLayout()
        setUpMainStackViewLayout()
        populateMainStackViewWith(examples: dataModel.labelKeys)
        if !self.isBeingPresented {
            closeIcon.isHidden = true
        }
        setUpButtonLayout()
    }
    
    private func setUpCloseIconLayout() {
        view.addSubview(closeIcon)
        closeIcon.translatesAutoresizingMaskIntoConstraints = false
        closeIcon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        closeIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 44).isActive = true
    }
    
    private func setUpTitleLayout() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: closeIcon.bottomAnchor, constant: 16).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
    }
    
    private func setUpMainStackViewLayout() {
        self.customContentView.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
       
        mainStackView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 16).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: self.customContentView.leadingAnchor, constant: 16).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: self.customContentView.trailingAnchor, constant: -16).isActive = true
        let constraint = self.mainStackView.bottomAnchor.constraint(greaterThanOrEqualTo: self.customContentView.safeAreaLayoutGuide.bottomAnchor, constant: -40)
        constraint.priority = UILayoutPriority(250)
        constraint.isActive = true
    }
    
    private func setUpScrollViewLayout() {
        self.view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo:  self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo:  self.view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo:  self.view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo:  self.view.bottomAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo:  self.view.widthAnchor).isActive = true
        scrollView.centerXAnchor.constraint(equalTo:  self.view.centerXAnchor).isActive = true
    }
    
    private func setUpContentViewLayout() {
        scrollView.addSubview(customContentView)
        customContentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        customContentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        customContentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        customContentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -80).isActive = true
        customContentView.widthAnchor.constraint(equalTo:    self.view.widthAnchor).isActive = true
        customContentView.heightAnchor.constraint(greaterThanOrEqualTo:  self.view.heightAnchor).isActive = true
    }
    
    private func setUpButtonLayout() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -37).isActive = true
    }
    
    @objc
    private func didTapCloseIcon() {
        dismiss(animated: true)
    }
    
    private func populateMainStackViewWith(examples: [String]) {
        for example in examples {
            let label = UILabel(frame: .zero)
            label.textColor = UIColor.theme(.dark50)
            label.font = UIFont.theme(id: .medium14)
            label.numberOfLines = 0
            let horizontalStackView = UIStackView(arrangedSubviews: [label])
            horizontalStackView.distribution = .fill
            horizontalStackView.alignment = .center
            horizontalStackView.axis = .horizontal
            horizontalStackView.spacing = 0
            
            label.text = example.localized
            
            mainStackView.addArrangedSubview(horizontalStackView)
            
        }
        
        mainStackView.addArrangedSubview(FreeSpaceView())
    }
    
    @objc
    private func didTapButton()  {
        if dataModel.showInfoViewForButtonAction {
            showInfoViewForButtonAction()
        } else {
            dataModel.buttonAction?()
        }
        
    }
    
    private func buildAlertViewModel() -> AlertViewModel {
        AlertViewModel(title: "lng.delete.habit".localized, subtitle: "lng.delete.habit.info.subtitle".localized, mainButtonTitle: "lng.common.yes", secondaryButttonTitle: "lng.common.no", mainButtonAction: detailButonButtonInfoModalMainButtonAction)
    }
    
    private func showInfoViewForButtonAction() {
        showAlert(with: buildAlertViewModel())
    }
    
    private func detailButonButtonInfoModalMainButtonAction() {
        dataModel.buttonAction?()
        hideAlert()
    }
}


struct BasicDetailViewDataModel {
    let titleKey: String
    let labelKeys: [String]
    var shouldHideButton: Bool = true
    var buttonTitle: String? = nil
    var buttonAction: (() -> Void)? = nil
    var buttonStyle: ButtonStyle = .primary
    var showInfoViewForButtonAction = false
}
