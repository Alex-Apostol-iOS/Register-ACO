//
//  HomeCoordinator.swift
//  RegisterACO
//
//  Created by Alex Apostol on 6/5/22.
//

import UIKit

class HomeCoordinator: Coordinator {
    
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
            buildHomeModule()
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
    
    private func buildHomeModule() {
        let vc = HomeBuilder { _ in
            
        }.build()
        
        navigator.setViewControllers([vc], animated: true)
    }
}
