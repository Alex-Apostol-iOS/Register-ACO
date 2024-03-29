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
        case willShowAllDone(habit: DtoPostiveHabit)
        case willShowFormResume
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
        case .willShowAllDone(_):
            showAllDone()
        case .willShowFormResume:
            showFormResume()
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
        let vc = HabitStepBuilder(stepData:basicStepViewControllerStepDTOContainer, modelImplementation: modelImplementation) { [weak self] output in
            switch output { 
            case .goToDetailViewController:
                self?.state = .didShowHabitStep
                self?.loop()
            case .goToNextStep(let habitStepData):
                self?.state = .willShowNextStep
                self?.modelImplementation.currentStep += 1
                self?.updateStepData(with: habitStepData)
                self?.loop()
            case .goToAllDone(let habit):
                self?.state = .willShowAllDone(habit: habit)
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
        let stepIndex = basicStepViewControllerStepDTOContainer.stepData.firstIndex { dataModel in
            dataModel.title == model.title
        }
        
        if let stepIndex = stepIndex {
            basicStepViewControllerStepDTOContainer.stepData[stepIndex] = model
        } else {
            basicStepViewControllerStepDTOContainer.stepData.append(model)
        }
    }
    
    private func showAllDone() {
        let viewModel = RegisterAllDoneViewModel(
            titleLabelKey: "lng.common.positiveHabit.allDone.title",
            mainButtonTitleKey: "lng.common.continue",
            secondaryButtonTitleKey: "lng.common.seeDetail",
            closeIconCustomAction: closeIconCustomAction
        )
        let vc = RegisterAllDoneBuilder(viewModel: viewModel) { [weak self] output in
            switch output {
            case .secondaryButton:
                self?.state = .willShowFormResume
                self?.loop()
            case .mainButton:
                self?.allDoneFinishNavigation()
            }
        }.build()
        vc.modalPresentationStyle = .fullScreen
        navigator.present(vc, animated: true)
    }
    
    private func closeIconCustomAction() {
        self.navigator.popToRootViewController(animated: true)
    }
    
    private func allDoneFinishNavigation() {
        let topVc = self.navigator.presentedViewController
        topVc?.dismiss(animated: true, completion: {
            self.navigator.popToRootViewController(animated: true)
        })
    }
    
    private func showFormResume() {
        let habitDetailModel = HabitDetailModel(positiveHabit: basicStepViewControllerStepDTOContainer)
        let vc = HabitDetailBuilder(habitModel: habitDetailModel) { _ in
            
        }.build()
        vc.modalPresentationStyle = .fullScreen
        let topVc = self.navigator.presentedViewController
        topVc?.present(vc, animated: true)
    }
}
