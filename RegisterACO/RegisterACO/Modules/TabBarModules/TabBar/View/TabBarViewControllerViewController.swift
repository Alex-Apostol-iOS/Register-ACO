//
//  TabBarViewControllerViewController.swift
//  RegisterACO
//
//  Created by Alex Apostol on 22/5/22.
//  
//

import UIKit

class TabBarViewControllerViewController: UITabBarController {
    
    private let presenter: TabBarViewControllerPresenterProtocol
        
    init (presenter: TabBarViewControllerPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        presenter.viewDidload()
        
        setTabBarItemColors()

    }
    
    private func setTabBarItemColors() {
        let appearance = UITabBarAppearance()
        
        appearance.backgroundColor = .white
        appearance.shadowImage = UIImage()
        appearance.shadowColor = .white
        
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor.theme(.baseLight20)
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.theme(.baseLight20)]
        appearance.stackedLayoutAppearance.normal.badgeBackgroundColor = .blue
        
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor.theme(.primary100)
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.theme(.primary100)]
        
        self.tabBar.standardAppearance = appearance
    }
    
}

extension TabBarViewControllerViewController: TabBarViewControllerViewProtocol {
    func layout(with tabBarModel: [TabBarModel]) {
        
        var tabBarViewController: [UIViewController] = []
        
        for model in tabBarModel {
            let item = UITabBarItem()
            item.title = model.title
            item.image = model.image
            
            
            let vc = model.vc
            
            vc.tabBarItem = item
            
            tabBarViewController.append(vc)
            
        }
        self.setViewControllers(tabBarViewController, animated: true)
        self.title = tabBarViewController.first?.title
    }
}


extension TabBarViewControllerViewController: UITabBarControllerDelegate {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        self.title = item.title
    }
}
