//
//  ProfilePresenterProtocol.swift
//  RegisterACO
//
//  Created by Alex Apostol on 27/5/22.
//  
//

import Foundation

protocol ProfilePresenterProtocol: AnyObject, GetLabel {
    var currentUser: DtoUser? {get}
    func viewDidLoad()
    func didTapLogout()
}
