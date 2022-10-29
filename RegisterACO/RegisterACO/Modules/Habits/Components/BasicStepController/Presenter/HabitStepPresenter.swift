//
//  HabitStepPresenter.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 12/10/22.
//  
//

import Foundation

class HabitStepPresenter {
    private var interactor: HabitStepInteractorProtocol
    weak var view: HabitStepViewProtocol?
    private var coordinatorOutput: (HabitStepOutput) -> Void
    private let modelImplementation: BasicStepControllerHelperImplementation
    
    init(modelImplementation: BasicStepControllerHelperImplementation, interactor: HabitStepInteractorProtocol, coordinnatorOutput: @escaping (HabitStepOutput) -> Void) {
        self.modelImplementation = modelImplementation
        self.interactor = interactor
        self.coordinatorOutput = coordinnatorOutput
    }
    
    private func createAlerViewControllerModel() -> AlertViewModel {
        let model = AlertViewModel(
            title: "lng.alert.flow.exit.title",
            subtitle: "lng.alert.flow.exit.subtitle",
            mainButtonTitle: "lng.common.yes",
            secondaryButttonTitle: "lng.common.no") { [weak self] in
                self?.view?.hideAlert()
                self?.view?.goBack()
                
            }
        return model
    }
    
    private var isLastStep: Bool {
        modelImplementation.currentStep == (BasicStepControllerModelType.allCases.count - 1)
    }
}

extension HabitStepPresenter: HabitStepPresenterProtocol {
    
    var viewModel: HabitStepModel {return modelImplementation.createHabitModel(for: BasicStepControllerModelType.allCases[modelImplementation.currentStep])}
    
    func didTapSeeExamples() {
        coordinatorOutput(.goToDetailViewController)
    }
    
    func didTapContinue(answer1: String, answer2: String) {
        if !isLastStep {
            coordinatorOutput(.goToNextStep(stepData: buildStepDTO(title: viewModel.titleKey.localized, answer1: answer1, answer2: answer2)))
        } else {
            interactor.postPositiveHabit(lastAnswer: buildStepDTO(title: viewModel.titleKey.localized, answer1: answer1, answer2: answer2)) { result in
                switch result {
                case .success(let habit):
                    print(habit)
                case .failure(let failure):
                    print(failure)
                }
            }
        }
    }
    
    private func buildStepDTO(title: String, answer1: String, answer2: String) -> BasicStepViewControllerStepDTO {
        return BasicStepViewControllerStepDTO (
            title: title,
            answer1: answer1,
            answer2: answer2)
    }
    
    func updateStep() {
        if modelImplementation.currentStep != 0 {
            modelImplementation.currentStep -= 1
        }
    }
    
    func didNavTapCloseIcon() {
        let model = createAlerViewControllerModel()
        view?.showAlert(with: model)
    }
    
    var flowProgress: Float {
        let progress =  100 / (BasicStepControllerModelType.allCases.count - 1)
        return (Float(progress) / 100) * Float(modelImplementation.currentStep)
    }
}
