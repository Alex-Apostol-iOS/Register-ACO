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
    
    private func parseDateToReadableDate(rawDate: String) -> String {
        let separatedRawDate = rawDate.split(separator: " ")
        return String(separatedRawDate.first ?? "")
    }
}

extension HabitListPresenter: HabitListPresenterProtocol {
    
    func buildListItemModel(from postiveHabit: DtoPostiveHabit) -> HabitListViewModel {
        return HabitListViewModel(
            title: "lng.common.positiveHabit".localized,
            subtitle: postiveHabit.name,
            date: parseDateToReadableDate(rawDate: postiveHabit.startDate))
    }
    
    func viewDidLoad() {
        interactor.getHabits { [weak self] result in
            switch result {
            case .success(let postiveHabits):
                self?.view?.layout(with: postiveHabits)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
