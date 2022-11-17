//
//  LoginViewModel.swift
//  RegisterACO
//
//  Created by Alex Apostol on 16/5/22.
//

import Foundation
import Combine

class LoginViewModel {
    @Published var email = ""
    @Published var password = ""
    
    private let emailPredicate = NSPredicate(format: "SELF MATCHES %@", Constants.emailPredicate.rawValue)
    
    private let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", Constants.passwordPredicate.rawValue)
    
    var validateCredentials: AnyPublisher<Bool, Never> {
        return Publishers.CombineLatest($email, $password)
            .map { email, password in
                return self.emailPredicate.evaluate(with: email) && self.passwordPredicate.evaluate(with: password)
            }.eraseToAnyPublisher()
    }
}
