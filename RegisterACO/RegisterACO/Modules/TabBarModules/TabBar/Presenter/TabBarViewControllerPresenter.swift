//
//  TabBarViewControllerPresenter.swift
//  RegisterACO
//
//  Created by Alex Apostol on 22/5/22.
//  
//

import Foundation
import UIKit

class TabBarViewControllerPresenter {
    private var interactor: TabBarViewControllerInteractorProtocol
    weak var view: TabBarViewControllerViewProtocol? {
        didSet {
            view?.layout(with: tabBarModel)
        }
    }
    private var coordinatorOutput: (TabBarViewControllerOutput) -> Void
    private var tabBarModel: [TabBarModel]

    init(tabBarModel: [TabBarModel], interactor: TabBarViewControllerInteractorProtocol, coordinnatorOutput: @escaping (TabBarViewControllerOutput) -> Void) {
        self.interactor = interactor
        self.coordinatorOutput = coordinnatorOutput
        self.tabBarModel = tabBarModel
    }
}

extension TabBarViewControllerPresenter: TabBarViewControllerPresenterProtocol {
    func viewDidload() {
        
    }
}

struct TabBarModel {
    let vc: UIViewController
    let image: UIImage
    let title: String
}
