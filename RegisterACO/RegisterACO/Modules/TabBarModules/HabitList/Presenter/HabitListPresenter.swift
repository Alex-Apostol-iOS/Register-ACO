//
//  HabitListPresenter.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 31/10/22.
//  
//

import Foundation

class HabitListPresenter {
    private var interactor: HabitListInteractorProtocol
    weak var view: HabitListViewProtocol?
    private var coordinatorOutput: (HabitListOutput) -> Void

    init(interactor: HabitListInteractorProtocol, coordinnatorOutput: @escaping (HabitListOutput) -> Void) {
        self.interactor = interactor
        self.coordinatorOutput = coordinnatorOutput
    }
}

extension HabitListPresenter: HabitListPresenterProtocol {
    func viewDidLoad() {
        interactor.getHabits { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
