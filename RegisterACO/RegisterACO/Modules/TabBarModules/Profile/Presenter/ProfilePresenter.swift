//
//  ProfilePresenter.swift
//  RegisterACO
//
//  Created by Alex Apostol on 27/5/22.
//  
//

import Foundation

class ProfilePresenter {
    private var interactor: ProfileInteractorProtocol
    weak var view: ProfileViewProtocol?
    private var coordinatorOutput: (ProfileOutput) -> Void

    init(interactor: ProfileInteractorProtocol, coordinnatorOutput: @escaping (ProfileOutput) -> Void) {
        self.interactor = interactor
        self.coordinatorOutput = coordinnatorOutput
    }
}

extension ProfilePresenter: ProfilePresenterProtocol {
    
}
