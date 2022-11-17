//
//  TabBarViewControllerInteractor.swift
//  RegisterACO
//
//  Created by Alex Apostol on 22/5/22.
//  
//

import Foundation

class TabBarViewControllerInteractor: TabBarViewControllerInteractorProtocol {
    
    private var dataManager: TabBarViewControllerDataManagerProtocol

    init(dataManager: TabBarViewControllerDataManagerProtocol) {
        self.dataManager = dataManager
    }
}
