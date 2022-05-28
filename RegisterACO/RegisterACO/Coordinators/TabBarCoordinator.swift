//
//  TabBarCoordinator.swift
//  RegisterACO
//
//  Created by Alex Apostol on 28/5/22.
//

import UIKit

class TabBarCoordinator: Coordinator, GetLabel {
    
    enum TabBarCoordinatorState {
        case initial
        case willShowHomeFlow
        case goToProfileFlow
        case willShowProfileFlow
    }
    
    private var currentTabCoordinator: Coordinator? {
        didSet {
            currentTabCoordinator?.start()
        }
    }
    
    private var currentState: TabBarCoordinatorState
    private let navigator: UINavigationController
    
    init(on navigator: UINavigationController, with state: TabBarCoordinatorState) {
        self.navigator = navigator
        self.currentState = state
        
    }
    
    func start() {
        
    }
    
    private func loop() {
        currentState = next(nextState: currentState)
        
        switch currentState {
        case .willShowHomeFlow:
            break
        case .willShowProfileFlow:
            break
        default:
            fatalError("no loop was implemented for \(currentState) on TabBarCoordiantor")
        }
        
    }
    
    private func next(nextState: TabBarCoordinatorState) -> TabBarCoordinatorState {
        switch nextState {
        case .initial:
            return .willShowHomeFlow
        case .goToProfileFlow:
            return .willShowProfileFlow
        default: return nextState
        }
    }
    
    private func goToHomeFlow() {
        
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
