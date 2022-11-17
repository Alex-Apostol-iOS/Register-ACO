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
    private let habitModel: HabitDetailModel

    init(habitModel: HabitDetailModel, interactor: HabitDetailInteractorProtocol, coordinnatorOutput: @escaping (HabitDetailOutput) -> Void) {
        self.habitModel = habitModel
        self.interactor = interactor
        self.coordinatorOutput = coordinnatorOutput
    }
    
    fileprivate func layout(input: HabitDetailModel) -> HabitDetailSection {
        let stepsData = input.positiveHabit.stepData
        
        var detailSections = HabitDetailSection(sectionData: [])
        
        for step in stepsData {
            detailSections.sectionData.append(HabitDetailSectionRowData(
                 sectionTitle: step.title,
                 rows: [step.question1, step.answer1, step.question2, step.answer2]))
        }
        
        return detailSections
    }
}

extension HabitDetailPresenter: HabitDetailPresenterProtocol {
    
    func viewDidLoad() {
        view?.layout(with: layout(input: habitModel))
    }
    
}

struct HabitDetailSection {
    var sectionData: [HabitDetailSectionRowData]
}

struct HabitDetailSectionRowData {
    let sectionTitle: String
    let rows: [String]
}

struct HabitDetailModel {
    let positiveHabit: BasicStepViewControllerStepDTOContainer
}
