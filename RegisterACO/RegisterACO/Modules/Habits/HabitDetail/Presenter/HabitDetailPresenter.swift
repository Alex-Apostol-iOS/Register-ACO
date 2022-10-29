//
//  HabitDetailPresenter.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 29/10/22.
//  
//

import Foundation

class HabitDetailPresenter {
    private var interactor: HabitDetailInteractorProtocol
    weak var view: HabitDetailViewProtocol?
    private var coordinatorOutput: (HabitDetailOutput) -> Void

    init(interactor: HabitDetailInteractorProtocol, coordinnatorOutput: @escaping (HabitDetailOutput) -> Void) {
        self.interactor = interactor
        self.coordinatorOutput = coordinnatorOutput
    }
}

extension HabitDetailPresenter: HabitDetailPresenterProtocol {
    
}
