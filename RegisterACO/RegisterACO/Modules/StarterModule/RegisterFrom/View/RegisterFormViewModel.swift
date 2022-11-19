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
        return Publishers.CombineLatest3($email, $firstName, $surname)
            .map { email, firstName , surname in
                return self.emailPredicate.evaluate(with: email) && self.noEmptyStringPredicate.evaluate(with: firstName)  && self.noEmptyStringPredicate.evaluate(with: surname)
            }.eraseToAnyPublisher()
    }
    
//   private var validateFirstsSurnameAndPhone: AnyPublisher<Bool, Never> {
//        return Publishers.CombineLatest($surname)
//            .map { surname, phone in
//                return  self.noEmptyStringPredicate.evaluate(with: surname))
//            }.eraseToAnyPublisher()
//    }
//
    private var validatePasswords: AnyPublisher<Bool, Never> {
        return Publishers.CombineLatest($password, $ConfirmedPassword)
            .map { password, ConfirmedPassword in
                return (self.passwordPredicate.evaluate(with: password) && self.passwordPredicate.evaluate(with: ConfirmedPassword)) && password == ConfirmedPassword
            }.eraseToAnyPublisher()
    }
    
    var validateCredentaials: AnyPublisher<Bool, Never> {
        return Publishers.CombineLatest(validateFirstNameAndEmail, validatePasswords)
            .receive(on: RunLoop.main)
            .map { isFirstNameAndEmail, isPasswordsValid in
                return isFirstNameAndEmail && isPasswordsValid
            }.eraseToAnyPublisher()
    }
    
    init() {}
}
