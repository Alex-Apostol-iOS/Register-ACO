//
//  TabBarViewControllerPresenter.swift
//  RegisterACO
//
//  Created by Alex Apostol on 22/5/22.
//  
//

import Foundation

class TabBarViewControllerPresenter {
    private var interactor: TabBarViewControllerInteractorProtocol
    weak var view: TabBarViewControllerViewProtocol?
    private var coordinatorOutput: (TabBarViewControllerOutput) -> Void

    init(interactor: TabBarViewControllerInteractorProtocol, coordinnatorOutput: @escaping (TabBarViewControllerOutput) -> Void) {
        self.interactor = interactor
        self.coordinatorOutput = coordinnatorOutput
    }
}

extension TabBarViewControllerPresenter: TabBarViewControllerPresenterProtocol {
    
}

struct TabBarModel {
    
}
