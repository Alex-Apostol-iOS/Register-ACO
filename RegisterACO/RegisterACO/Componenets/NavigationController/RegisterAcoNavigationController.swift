//
//  RegisterAcoNavigationController.swift
//  RegisterACO
//
//  Created by Alex Apostol on 16/4/22.
//

import UIKit

class RegisterAcoNavigationController: UIViewController, GetLabel {
    
    private lazy var backLabel: UILabel = {
        let label = UILabel(frame: .zero)
        let attributeText = [NSAttributedString.Key.font : UIFont.theme(id: .regular16), NSAttributedString.Key.foregroundColor: UIColor.white]
        label.attributedText = NSAttributedString(string: getlabelForKey(key: "lng.back" ), attributes: attributeText)
        return label
    }()
    
    var rightBarButtonAction: (() -> Void)?
    
    private lazy var rightBarButtonItem: UIBarButtonItem = {
        let image = UIImage(named: "close")?.withRenderingMode(.alwaysTemplate).withTintColor(.white)
        let view = UIBarButtonItem(image: image, landscapeImagePhone: nil, style: .plain, target: self, action: #selector(didTapRightBarButtonItem))
        view.tintColor = .white
        return view
    }()
    
    
    override func viewDidLoad() {
        configureNavBarTintColor()
        self.navigationController?.navigationBar.tintColor = .white
        super.viewDidLoad()
        view.backgroundColor = .white
        setNeedsStatusBarAppearanceUpdate()
    }
    
    func configureNavBarTintColor(withColor: UIColor = UIColor.theme(.primary100)) {
        let toolbarAppearance = UIToolbarAppearance()
        toolbarAppearance.configureWithOpaqueBackground()

        toolbarAppearance.backgroundColor = withColor
        self.navigationController?.toolbar.standardAppearance = toolbarAppearance;
        if #available(iOS 15.0, *) {
            self.navigationController?.toolbar.scrollEdgeAppearance = self.navigationController?.toolbar.standardAppearance
        } else {
            // Fallback on earlier versions
        }

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = withColor
        appearance.shadowImage = UIImage()
        appearance.shadowColor = .clear
        appearance.backgroundImage = UIImage()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.standardAppearance = appearance;
        self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance
    }
    
    func configTitle(title: String) {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.theme(id: .bold14), NSAttributedString.Key.foregroundColor: UIColor.white]
        self.title = title
    }
    
    func configTitleAndCloseIcon(title: String) {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.theme(id: .bold14), NSAttributedString.Key.foregroundColor: UIColor.white]
        self.title = title
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    @objc
    private func didTapRightBarButtonItem() {
        rightBarButtonAction?()
    }
}

class CustomNavigationController: UINavigationController {
    override var childForStatusBarStyle: UIViewController? {
        return visibleViewController
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return visibleViewController?.preferredStatusBarStyle ?? .lightContent
    }
}
