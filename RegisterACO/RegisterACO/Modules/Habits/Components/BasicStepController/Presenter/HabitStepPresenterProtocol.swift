//
//  HabitStepPresenterProtocol.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 12/10/22.
//  
//

import Foundation

protocol HabitStepPresenterProtocol: AnyObject {
    func didTapSeeExamples()
    var viewModel: HabitStepModel {get}
    func didTapContinue()
    func updateStep()
    func didNavTapCloseIcon()
    var flowProgress: Float {get}
}
