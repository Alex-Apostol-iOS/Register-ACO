//
//  PostiveHabitInfoViewPresenter.swift
//  RegisterACO
//
//  Created by Alex Apostol on 2/7/22.
//  
//

import Foundation

class PostiveHabitInfoViewPresenter {
    private var interactor: PostiveHabitInfoViewInteractorProtocol
    weak var view: PostiveHabitInfoViewViewProtocol?
    private var coordinatorOutput: (PostiveHabitInfoViewOutput) -> Void

    init(interactor: PostiveHabitInfoViewInteractorProtocol, coordinnatorOutput: @escaping (PostiveHabitInfoViewOutput) -> Void) {
        self.interactor = interactor
        self.coordinatorOutput = coordinnatorOutput
    }
}

extension PostiveHabitInfoViewPresenter: PostiveHabitInfoViewPresenterProtocol {
    
}
