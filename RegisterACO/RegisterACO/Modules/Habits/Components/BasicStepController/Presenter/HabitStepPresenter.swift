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
}

extension HabitStepPresenter: HabitStepPresenterProtocol {
    
    var viewModel: HabitStepModel {return modelImplementation.createHabitModel(for: BasicStepControllerModelType.allCases[modelImplementation.currentStep])}
    
    func didTapSeeExamples() {
        coordinatorOutput(.goToDetailViewController)
    }
    
    func didTapContinue() {
        coordinatorOutput(.goToNextStep)
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
}
