//
//  BasicStepControllerHelper.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 19/10/22.
//

import Foundation


protocol BasicStepControllerHelper: AnyObject {
    func createModel(for useCase: BasicStepControllerModelType) -> BasicDetailViewDataModel
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
}


enum BasicStepControllerModelType {
    case makeItObviousExampleModel
}
