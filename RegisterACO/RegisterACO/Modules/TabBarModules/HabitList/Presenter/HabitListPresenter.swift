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
    private var currentSelectedHabit: DtoPostiveHabit?
    
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
    
    func deleteHabit() {
        interactor.deleteHabit(name: currentSelectedHabit?.name ?? "") { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}

extension HabitListPresenter: HabitListPresenterProtocol {
    
    func buildHabitDetailModel(from item: DtoPostiveHabit ) -> BasicDetailViewDataModel {
        self.currentSelectedHabit = item
        let habitDetailModel = BasicDetailViewDataModel(
            titleKey: item.name,
            labelKeys: ["lng.obviousHabit.textArea.placeHolder",
                        item.habitAcumultationStrategy?.actualHabit ?? "",
                        "lng.obviousHabit.textArea.NewHabit.placeHolder",
                        item.habitAcumultationStrategy?.newHabit ?? "" ,
                        "lng.attractHabit.firstTextField.placeHolder",
                        item.attractiveAnswer,
                        "lng.attractHabit.secondTextField.placeHolder",
                        item.satisfactionAnswer,
                        "lng.makeItEasy.firstTextField.placeHolder",
                        item.obviousAnswer,
                        "lng.makeItEasy.secondTextField.placeHolder",
                        item.easyAnswer,
            ],
            shouldHideButton: false,
            buttonTitle: "lng.delete.habit",
            buttonAction: deleteHabit,
            buttonStyle: .negativeAction
            )
        return habitDetailModel
    }
    
    func didTapCell(item: DtoPostiveHabit) {
        
        coordinatorOutput(.goToHabitDetail(detailModel: buildHabitDetailModel(from: item)))
    }
    
    func buildListItemModel(from postiveHabit: DtoPostiveHabit) -> HabitListViewModel {
        return HabitListViewModel(
            title: postiveHabit.habitAcumultationStrategy?.newHabit ?? "",
            subtitle: "lng.common.positiveHabit".localized,
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
