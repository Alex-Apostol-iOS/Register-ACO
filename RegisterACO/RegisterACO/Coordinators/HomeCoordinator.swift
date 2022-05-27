//
//  HomeCoordinator.swift
//  RegisterACO
//
//  Created by Alex Apostol on 6/5/22.
//

import UIKit

class HomeCoordinator: Coordinator, GetLabel {
    
    enum HomeCoordinatorState {
        case initial
        case willShowHome
        case didShowHome
    }
    
    private var navigator: UINavigationController
    private var currentState: HomeCoordinatorState
    
    init(with navigator: UINavigationController) {
        self.navigator = navigator
        currentState = .initial
    }
    
    func start() {
        loop()
    }
    
    func loop() {
        switch next(state: currentState) {
        case .willShowHome:
            buildTaBarViewController()
        case .didShowHome, .initial:
            fatalError("No navigation for this cases")
        }
    }
    
    func next(state: HomeCoordinatorState) -> HomeCoordinatorState {
        switch state {
        case .initial:
            return .willShowHome
        default: return state
        }
    }
    
    private func setUpTabBarModel() -> [TabBarModel] {
        var tabBarvc: [TabBarModel] = []
        let homeTabBarModel = TabBarModel(vc: buildHomeModule(), image: UIImage(named: "home_001")?.withRenderingMode(.alwaysTemplate).withTintColor(UIColor.theme(.primary100)) ?? UIImage(), title: getlabelForKey(key: "lng.common.home"))
        
        tabBarvc.append(homeTabBarModel)
        
        let profileTabBarModel = TabBarModel(vc: buildProfileModule() , image: UIImage(named: "user_icon-1")?.withRenderingMode(.alwaysTemplate).withTintColor(UIColor.theme(.primary100)) ?? UIImage(), title: getlabelForKey(key: "lng.common.profile"))
        
        tabBarvc.append(profileTabBarModel)
        return tabBarvc
    }
    
    private func buildTaBarViewController() {
        let vc = TabBarViewControllerBuilder(tabBarModel: setUpTabBarModel()) { _ in
            
        }.build()
        
        navigator.setViewControllers([vc], animated: true)
        navigator.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    private func buildHomeModule() -> UIViewController {
        let vc = HomeBuilder { _ in
            
        }.build()
        
        return vc
    }
    
    private func buildProfileModule() -> UIViewController {
        let vc = ProfileBuilder { _ in
            
        }.build()
        return vc
    }
}
