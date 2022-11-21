//
//  Login_RegisterPresenter.swift
//  RegisterACO
//
//  Created by Alex Apostol on 16/4/22.
//  
//

import Foundation

class Login_RegisterPresenter {
    private var interactor: Login_RegisterInteractorProtocol
    weak var view: Login_RegisterViewProtocol?
    private var coordinatorOutput: (Login_RegisterOutput) -> Void
    private let type: LoginRegisterUserType

    init(type: LoginRegisterUserType, interactor: Login_RegisterInteractorProtocol, coordinnatorOutput: @escaping (Login_RegisterOutput) -> Void) {
        self.type = type
        self.interactor = interactor
        self.coordinatorOutput = coordinnatorOutput
    }
    
    private func layoutCarrousel() -> [StartCarrouselCollectionViewCellModel] {
        var models = [StartCarrouselCollectionViewCellModel]()
        
        models.append(StartCarrouselCollectionViewCellModel(
            titleKey: "lng.carrousel.step1.title",
            subtitleKey: "lng.carrousel.step1.subTitle",
            imageUrl: "Money"))
        
        models.append(StartCarrouselCollectionViewCellModel(
            titleKey: "lng.carrousel.step2.title",
            subtitleKey: "lng.carrousel.step2.subTitle",
            imageUrl: "SheetMoney"))
        
        models.append(StartCarrouselCollectionViewCellModel(
            titleKey: "lng.carrousel.step3.title",
            subtitleKey: "lng.carrousel.step3.subTitle",
            imageUrl: "plan"))
        return models
    }
    
    func viewDidLoad() {
        view?.darwCarrousel(with: layoutCarrousel())
    }
}

extension Login_RegisterPresenter: Login_RegisterPresenterProtocol {
    func didTapRegisterButton() {
        coordinatorOutput(.goToRegisterForm)
    }
    
    func didTapLoginButtton() {
        coordinatorOutput(.goToLogin)
    }
}
