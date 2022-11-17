//
//  RegisterAllDoneBuilder.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 29/10/22.
//

import UIKit


class RegisterAllDoneBuilder: Builder {
    private let viewModel: RegisterAllDoneViewModel
    private let coordinatorOutput: (RegisterAllDoneViewOutput) -> Void
    
    init(viewModel: RegisterAllDoneViewModel, coordinatorOutput: @escaping (RegisterAllDoneViewOutput) -> Void) {
        self.viewModel = viewModel
        self.coordinatorOutput = coordinatorOutput
    }
    
    
    func build() -> UIViewController {
        let presenter = RegisterAllDoneViewPresenter(viewModel: viewModel, coordinatorOutput: coordinatorOutput)
        let view = RegisterACOAllDone(presenter: presenter)
        presenter.view = view
        return view
    }
}
