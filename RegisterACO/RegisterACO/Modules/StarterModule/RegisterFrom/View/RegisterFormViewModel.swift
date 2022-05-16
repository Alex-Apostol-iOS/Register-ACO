//
//  RegisterFormViewModel.swift
//  RegisterACO
//
//  Created by Alex Apostol on 24/4/22.
//

import Foundation
import Combine

class RegisterFormViewModel {
    @Published var email = ""
    @Published var firstName = ""
    @Published var surname = ""
    @Published var secondSurname = ""
    @Published var phone = ""
    @Published var password = ""
    @Published var ConfirmedPassword = ""
    
    var cancellableSet: Set<AnyCancellable> = []
    
    private let emailPredicate = NSPredicate(format: "SELF MATCHES %@", Constants.emailPredicate.rawValue)
    
   private let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", Constants.passwordPredicate.rawValue)
    
    private let noEmptyStringPredicate = NSPredicate(format: "SELF MATCHES %@", Constants.noEmptyStringPredicate.rawValue)
    
    private let spanishphoneStringPredicate = NSPredicate(format: "SELF MATCHES %@", Constants.spanishphoneStringPredicate.rawValue)
    
    private var validateFirstNameAndEmail: AnyPublisher<Bool, Never> {
        return Publishers.CombineLatest($email, $firstName)
            .map { email, firstName in
                return self.emailPredicate.evaluate(with: email) && self.noEmptyStringPredicate.evaluate(with: firstName)
            }.eraseToAnyPublisher()
    }
    
   private var validateFirstsSurnameAndPhone: AnyPublisher<Bool, Never> {
        return Publishers.CombineLatest($surname, $phone)
            .map { surname, phone in
                return  self.noEmptyStringPredicate.evaluate(with: surname) && self.spanishphoneStringPredicate.evaluate(with: phone)
            }.eraseToAnyPublisher()
    }
    
    private var validatePasswords: AnyPublisher<Bool, Never> {
        return Publishers.CombineLatest($password, $ConfirmedPassword)
            .map { password, ConfirmedPassword in
                return (self.passwordPredicate.evaluate(with: password) && self.passwordPredicate.evaluate(with: ConfirmedPassword)) && password == ConfirmedPassword
            }.eraseToAnyPublisher()
    }
    
    var validateCredentaials: AnyPublisher<Bool, Never> {
        return Publishers.CombineLatest3(validateFirstNameAndEmail, validateFirstsSurnameAndPhone, validatePasswords)
            .receive(on: RunLoop.main)
            .map { isFirstNameAndEmail, isFirstNameAndPasswordValid, isPasswordsValid in
                return isFirstNameAndEmail && isFirstNameAndPasswordValid && isPasswordsValid
            }.eraseToAnyPublisher()
    }
    
    init() {}
}
