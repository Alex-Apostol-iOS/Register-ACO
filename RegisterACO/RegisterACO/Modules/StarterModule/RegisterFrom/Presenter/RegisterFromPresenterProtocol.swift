//
//  RegisterFromPresenterProtocol.swift
//  RegisterACO
//
//  Created by Alex Apostol on 24/4/22.
//  
//

import Foundation

protocol RegisterFromPresenterProtocol: AnyObject, GetLabel {
    
    func didTapSubmit(viewModel: RegisterFormViewModel)
}
