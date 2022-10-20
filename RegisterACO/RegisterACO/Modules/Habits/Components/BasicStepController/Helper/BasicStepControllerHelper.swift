//
//  BasicStepControllerHelper.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 19/10/22.
//

import Foundation


protocol BasicStepControllerHelper: AnyObject {
    func createModel(for useCase: BasicStepControllerModelType) -> BasicDetailViewDataModel
    func createHabitModel(for useCase: BasicStepControllerModelType) -> HabitStepModel
}

extension BasicStepControllerHelper {
    
    func createModel(for useCase: BasicStepControllerModelType) -> BasicDetailViewDataModel {
        switch useCase {
        case .makeItObviousExampleModel:
            let dataModel = BasicDetailViewDataModel(titleKey: "lng.obviousHabit.title", labelKeys: [
                "lng.obviousHabit.example1",
                "lng.obviousHabit.example2",
                "lng.obviousHabit.example3",
                "lng.obviousHabit.example4",
                "lng.obviousHabit.example5"
            ])
            return dataModel
        }
    }
    
    func createHabitModel(for useCase: BasicStepControllerModelType) -> HabitStepModel {
        switch useCase {
        case .makeItObviousExampleModel:
            let dataModel = HabitStepModel(
                navTtleKey: "lng.obviousHabit.nav.title",
                titleKey: "lng.obviousHabit.title",
                descriptionKey: "lng.obviousHabit.description",
                firstTextAreaPlaceHolderKey: "lng.obviousHabit.textArea.placeHolder",
                secondTextAreaPlaceHolderKey: "lng.obviousHabit.textArea.NewHabit.placeHolder",
                mainButtonModel: HabitStepButtonModel(
                    titleKey: "lng.common.continue"
                ),
                secondaryButtonModel: HabitStepButtonModel(
                    titleKey: "lng.common.seeExamples"
                )
            )
            return dataModel
        }
    }
}


enum BasicStepControllerModelType: CaseIterable {
    case makeItObviousExampleModel
}

class BasicStepControllerHelperImplementation: BasicStepControllerHelper {
    var currentStep = 0
}

struct HabitStepModel {
    let navTtleKey: String
    let titleKey: String
    let descriptionKey: String
    let firstTextAreaPlaceHolderKey: String
    let secondTextAreaPlaceHolderKey: String
    let mainButtonModel: HabitStepButtonModel
    let secondaryButtonModel: HabitStepButtonModel
}

struct HabitStepButtonModel {
    let titleKey: String
    let shouldHideButton: Bool = false
}
