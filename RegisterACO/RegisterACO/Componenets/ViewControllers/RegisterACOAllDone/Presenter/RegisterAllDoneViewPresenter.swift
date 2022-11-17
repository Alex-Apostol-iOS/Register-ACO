//
//  RegisterAllDoneViewPresenter.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 29/10/22.
//

import Foundation


class RegisterAllDoneViewPresenter {
    private  let _viewModel: RegisterAllDoneViewModel
    private let coordinatorOutput: (RegisterAllDoneViewOutput) -> Void
    weak var view: RegisterAllDoneViewProtocol?
    
    init(viewModel: RegisterAllDoneViewModel, coordinatorOutput: @escaping (RegisterAllDoneViewOutput) -> Void) {
        self._viewModel = viewModel
        self.coordinatorOutput = coordinatorOutput
    }
}

extension RegisterAllDoneViewPresenter: RegisterAllDoneViewPresenterProtocol {
    var viewModel: RegisterAllDoneViewModel {
        self._viewModel
    }
    
    func didPressMainButton() {
        coordinatorOutput(.mainButton)
    }
    
    func didPressSecondaryButton() {
        coordinatorOutput(.secondaryButton)
    }
    
    func customCloseIconAction() {
        viewModel.closeIconCustomAction?()
    }
}
