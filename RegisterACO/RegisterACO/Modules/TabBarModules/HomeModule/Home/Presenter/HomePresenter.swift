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
    @Cache(.userSession)
    var dtoUser: DtoUser?

    init(interactor: HomeInteractorProtocol, coordinnatorOutput: @escaping (HomeOutput) -> Void) {
        self.interactor = interactor
        self.coordinatorOutput = coordinnatorOutput
    }
}

extension HomePresenter: HomePresenterProtocol {
    func viewDidLoad() {
        if let dtoUser = dtoUser, let user = dtoUser.user {
            view?.layout(with: [user])
        }
    }
}

enum HomeListSection {
    case users
}
