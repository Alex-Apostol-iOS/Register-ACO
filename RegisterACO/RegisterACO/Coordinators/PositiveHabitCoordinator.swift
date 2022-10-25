//
//  PositiveHabitCoordinator.swift
//  RegisterACO
//
//  Created by Alex Apostol on 2/7/22.
//

import UIKit

class PositiveHabitCoordinator: Coordinator {
    
     enum PositiveHabitCoordinatorState {
        case initial
        case willShowPositiveHabitInfoView
        case didShowPositiveHabitInfoView
        case showPositiveHabitStep
        case didShowHabitStep
        case willShowHabitStepDetail
        case willShowNextStep
    }
    
    private let navigator: UINavigationController
    private var state: PositiveHabitCoordinatorState
    private let modelImplementation:  BasicStepControllerHelperImplementation
    private var stepsVcs: [UIViewController]
    private let basicStepViewControllerStepDTOContainer : BasicStepViewControllerStepDTOContainer
    
    
    init(on navigator: UINavigationController, with state: PositiveHabitCoordinatorState = .initial) {
        self.navigator = navigator
        self.state = state
        modelImplementation = BasicStepControllerHelperImplementation()
        stepsVcs = []
        basicStepViewControllerStepDTOContainer = BasicStepViewControllerStepDTOContainer()
    }
    
    func start() {
        state = .initial
        loop()
    }
    
    private func loop() {
        switch next(nextState: state) {
        case .willShowPositiveHabitInfoView:
            showPositiveHabitInfoView()
        case .showPositiveHabitStep:
            showPositiveHabitStep()
        case .willShowHabitStepDetail:
            goToHabitStepDetail()
        case .willShowNextStep:
            showPositiveHabitStep()
        case .initial, .didShowPositiveHabitInfoView, .didShowHabitStep:
            fatalError("no implementation for \(next(nextState: state)) on PositiveHabitCoordinator")
        }
    }
    
    private func next(nextState: PositiveHabitCoordinatorState) -> PositiveHabitCoordinatorState {
        switch nextState {
        case .initial:
            return .willShowPositiveHabitInfoView
        case .didShowPositiveHabitInfoView:
            return .showPositiveHabitStep
        case .didShowHabitStep:
            return .willShowHabitStepDetail
        default: return nextState
        }
    }
    
    private func showPositiveHabitInfoView() {
        let vc = PostiveHabitInfoViewBuilder { [weak self] output in
            switch output {
            case .goToPositiveHabitStep:
                self?.state = .didShowPositiveHabitInfoView
                self?.loop()
            }
        }.build()
        navigator.pushViewController(vc, animated: true)
    }
    
    private func showPositiveHabitStep() {
        let vc = HabitStepBuilder(modelImplementation: modelImplementation) { [weak self] output in
            switch output { 
            case .goToDetailViewController:
                self?.state = .didShowHabitStep
                self?.loop()
            case .goToNextStep(let habitStepData):
                self?.state = .willShowNextStep
                self?.modelImplementation.currentStep += 1
                self?.updateStepData(with: habitStepData)
                self?.loop()
                
            }
        }.build()
        stepsVcs.append(vc)
        let cacheViewController = stepsVcs[modelImplementation.currentStep]
        
        navigator.pushViewController(cacheViewController, animated: true)
    }
    
    private func goToHabitStepDetail() {
        let viewDataModel = modelImplementation.createModel(for: BasicStepControllerModelType.allCases[modelImplementation.currentStep])
        let vc = BasicDetailViewController(dataModel: viewDataModel)
        vc.modalPresentationStyle = .fullScreen
        navigator.present(vc, animated: true)
    }
    
    private func updateStepData(with model: BasicStepViewControllerStepDTO) {
        removeDuplacateStepDataIfNeeded(for: model)
        basicStepViewControllerStepDTOContainer.stepData.append(model)
    }
    
    private func removeDuplacateStepDataIfNeeded(for model: BasicStepViewControllerStepDTO) {
        basicStepViewControllerStepDTOContainer.stepData.removeAll(where: {$0.title == model.title})
    }
    
}
