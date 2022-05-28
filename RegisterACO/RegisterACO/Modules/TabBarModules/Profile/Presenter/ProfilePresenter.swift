//
//  ProfilePresenter.swift
//  RegisterACO
//
//  Created by Alex Apostol on 27/5/22.
//  
//

import Foundation
import UIKit

class ProfilePresenter {
    private var interactor: ProfileInteractorProtocol
    weak var view: ProfileViewProtocol?
    private var coordinatorOutput: (ProfileOutput) -> Void
    @Cache(.userSession)
    var dtoUser: DtoUser?

    init(interactor: ProfileInteractorProtocol, coordinnatorOutput: @escaping (ProfileOutput) -> Void) {
        self.interactor = interactor
        self.coordinatorOutput = coordinnatorOutput
    }
}

extension ProfilePresenter: ProfilePresenterProtocol {
    var currentUser: DtoUser? {
        return dtoUser
    }
    
    func viewDidLoad() {
        var tableViewModel: [ProfileTableViewCellModel] = []
        tableViewModel.append(ProfileTableViewCellModel(image: "logout_001", cellText: getlabelForKey(key: "lng.common.logout"), imageContainerColor: UIColor.theme(.red50), type: .logout))
        
        view?.layout(with: tableViewModel)
    }
    
    func didTapLogout() {
        coordinatorOutput(.goToLogout)
    }
}

