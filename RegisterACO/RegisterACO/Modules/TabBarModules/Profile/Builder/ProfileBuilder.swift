//
//  ProfileBuilder.swift
//  RegisterACO
//
//  Created by Alex Apostol on 27/5/22.
//  
//

import Foundation
import UIKit

class ProfileBuilder: Builder {
    
    private var coordinatorOutput: (ProfileOutput) -> Void
    
    init(coordinnatorOutput: @escaping (ProfileOutput) -> Void) {
        self.coordinatorOutput = coordinnatorOutput
    }
    
    func build() -> UIViewController {
        let dataManager = ProfileDataManager()
        let interactor = ProfileInteractor(dataManager: dataManager)
        let presenter = ProfilePresenter(interactor: interactor, coordinnatorOutput: coordinatorOutput)
        let view = ProfileViewController(presenter: presenter)
        presenter.view = view
        return view
    }
    
}
