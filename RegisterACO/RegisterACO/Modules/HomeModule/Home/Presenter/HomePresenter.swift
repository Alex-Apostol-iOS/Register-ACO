//
//  HomePresenter.swift
//  RegisterACO
//
//  Created by Alex Apostol on 7/5/22.
//  
//

import Foundation
import UIKit

class HomePresenter {
    var interactor: HomeInteractorProtocol
    weak var view: HomeViewProtocol?
    var coordinatorOutput: (HomeOutput) -> Void

    init(interactor: HomeInteractorProtocol, coordinnatorOutput: @escaping (HomeOutput) -> Void) {
        self.interactor = interactor
        self.coordinatorOutput = coordinnatorOutput
    }
}

extension HomePresenter: HomePresenterProtocol {
}

enum HomeListSection {
    case users
}
