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
        case willShowTabBar
    }
    
   
    private var currentState: TabBarCoordinatorState
    private let navigator: UINavigationController
    
    private let homeChildCoordinator: HomeCoordinator
    private let profileChildCoordinator: ProfileCoordinator
    private let habitListCoordinator: HabitListCoordinator
    private weak var tabBarRefernce: UITabBarController?
    
    init(on navigator: UINavigationController, with state: TabBarCoordinatorState) {
        self.navigator = navigator
        self.currentState = state
        homeChildCoordinator = HomeCoordinator(with: navigator)
        profileChildCoordinator =  ProfileCoordinator(on: navigator)
        habitListCoordinator = HabitListCoordinator(on: navigator, with: .inital)
        
    }
    
    func start() {
        loop()
    }
    
    private func loop() {
        currentState = next(nextState: currentState)
        
        switch currentState {
        case .willShowTabBar:
            buildTaBarViewController()
        default:
            fatalError("no loop was implemented for \(currentState) on TabBarCoordiantor")
        }
        
    }
    
    private func next(nextState: TabBarCoordinatorState) -> TabBarCoordinatorState {
        switch nextState {
        case .initial:
            return .willShowTabBar
        default: return nextState
        }
    }
    
    private func setUpTabBarModel() -> [TabBarModel] {
        var tabBarvc: [TabBarModel] = []
        let homeTabBarModel = TabBarModel(vc: buildHomeModule(), image: UIImage(named: "home_001")?.withRenderingMode(.alwaysTemplate).withTintColor(UIColor.theme(.primary100)) ?? UIImage(), title: getlabelForKey(key: "lng.common.home"))
        
        tabBarvc.append(homeTabBarModel)
        
        let habitListTabBarModel = TabBarModel(vc: buildHabitListModule(), image: UIImage(named: "habitList")?.withRenderingMode(.alwaysTemplate).withTintColor(UIColor.theme(.primary100)) ?? UIImage(), title: "lng.habitList.tab.title".localized)
        
        tabBarvc.append(habitListTabBarModel)
        
        let profileTabBarModel = TabBarModel(vc: buildProfileModule() , image: UIImage(named: "user_icon-1")?.withRenderingMode(.alwaysTemplate).withTintColor(UIColor.theme(.primary100)) ?? UIImage(), title: getlabelForKey(key: "lng.common.profile"))
        
        tabBarvc.append(profileTabBarModel)
        
       
        return tabBarvc
    }
    
    private func buildTaBarViewController() {
        let vc = TabBarViewControllerBuilder(tabBarModel: setUpTabBarModel()) { output in
            switch output {
            case .goToHabitList:
                self.goToHabitList()
            }
        }.build()
        
        navigator.setViewControllers([vc], animated: true)
        navigator.interactivePopGestureRecognizer?.isEnabled = true
        tabBarRefernce = vc as! UITabBarController
    }
    
    private func buildHomeModule() -> UIViewController {
        let vc = HomeBuilder { [weak self] output in
            self?.homeChildCoordinator.manageHomeInternalNavigation(with: output)
        }.build()
        
        return vc
    }
    
    private func buildProfileModule() -> UIViewController {
        let vc = ProfileBuilder {  output in
            self.profileChildCoordinator.manageProfileInternalNavigation(output: output)
        }.build()
        return vc
    }
    
    private func buildHabitListModule() -> UIViewController {
        let vc = HabitListBuilder {[weak self] output in
            self?.habitListCoordinator.manageHabitListInternalNavigation(with: output)
        }.build()
        return vc
    }
    
    private func goToHabitList()  {
        tabBarRefernce?.selectedIndex = 1
    }
}
