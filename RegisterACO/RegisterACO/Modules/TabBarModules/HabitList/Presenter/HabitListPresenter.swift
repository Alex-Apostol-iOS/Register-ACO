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
    
    private func sortHabitByDate(habits: [DtoPostiveHabit]) -> [DtoPostiveHabit] {
       
        return habits.sorted(by: {
            let dateFromatter = DateFormatter()
            dateFromatter.dateFormat = "YY-MM-DD"
            guard let date1 = dateFromatter.date(from: self.parseDateToReadableDate(rawDate: $0.startDate)),
                  let date2 = dateFromatter.date(from: self.parseDateToReadableDate(rawDate: $1.startDate)) else {return false}
            return date1 < date2
        })
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
                self?.view?.layout(with: self?.sortHabitByDate(habits: postiveHabits) ?? [])
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
