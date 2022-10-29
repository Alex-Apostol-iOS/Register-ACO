//
//  RegisterAllDoneViewModelProtocol.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 29/10/22.
//

import Foundation

protocol RegisterAllDoneViewPresenterProtocol: AnyObject {
    var viewModel: RegisterAllDoneViewModel {get}
    func didPressMainButton()
    func didPressSecondaryButton()
}
