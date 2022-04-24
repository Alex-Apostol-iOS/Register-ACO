//
//  RegisterFormViewModel.swift
//  RegisterACO
//
//  Created by Alex Apostol on 24/4/22.
//

import Foundation
import Combine

class RegisterFormViewModel: ObservableObject {
    @Published var email = ""
    @Published var firstName = ""
    @Published var surname = ""
    @Published var secondSurname = ""
    @Published var phone = ""
    @Published var password = ""
    @Published var ConfirmedPassword = ""
    
    @Published var isEmailCriteriaValid = false
    @Published var isFirstNameCriteriaValid = false
    @Published var isSurnameCriteriaValid = false
    @Published var isSecondSurnameCriteriaValid = false
    @Published var isPhoneCriteriaValid = false
    @Published var isPasswordCriteriaValid = false
    @Published var IsPasswordConfirmedCriterValid = false
    @Published var canSubmit = false
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", "(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])")
    
    let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,}$")
    
    let noEmptyStringPredicate = NSPredicate(format: "SELF MATCHES %@", "^(?!\\s*$).+")
    
    let spanishphoneStringPredicate = NSPredicate(format: "SELF MATCHES %@", " (\\+34|0034|34)?[ -]*(6|7)[ -]*([0-9][ -]*){8}")
    
    init() {
        $email
            .map { email in
                return self.emailPredicate.evaluate(with: email)
            }
        .assign(to: \.isEmailCriteriaValid, on: self)
        .store(in: &cancellableSet)
        
        $password
            .map { password in
                return self.passwordPredicate.evaluate(with: password)
            }
        .assign(to: \.isPasswordCriteriaValid, on: self)
        .store(in: &cancellableSet)
        
        $phone
            .map { phone in
                return self.spanishphoneStringPredicate.evaluate(with: phone)
            }
        .assign(to: \.isPhoneCriteriaValid, on: self)
        .store(in: &cancellableSet)
        
        $firstName
            .map { string in
                return self.noEmptyStringPredicate.evaluate(with: string)
            }
        .assign(to: \.isFirstNameCriteriaValid, on: self)
        .store(in: &cancellableSet)
        
        $surname
            .map { string in
                return self.noEmptyStringPredicate.evaluate(with: string)
            }
            .assign(to: \.isSurnameCriteriaValid, on: self)
        .store(in: &cancellableSet)
        
        Publishers.CombineLatest($password, $ConfirmedPassword)
            .map { password, ConfirmedPassword in
                return password == ConfirmedPassword
            }
            .assign(to: \.IsPasswordConfirmedCriterValid, on: self)
            .store(in: &cancellableSet)
        
        Publishers.CombineLatest( Publishers.CombineLatest3($isEmailCriteriaValid, $isFirstNameCriteriaValid, $isSurnameCriteriaValid)
                                    .map { isEmailCriteriaValid, isFirstNameCriteriaValid, isSurnameCriteriaValid in
                                        return (isEmailCriteriaValid && isFirstNameCriteriaValid && isSurnameCriteriaValid)
                                    },  Publishers.CombineLatest3($isPhoneCriteriaValid, $isPasswordCriteriaValid, $IsPasswordConfirmedCriterValid)
                                    .map { isPhoneCriteriaValid, isPasswordCriteriaValid, IsPasswordConfirmedCriterValid in
                                        return (isPhoneCriteriaValid && isPasswordCriteriaValid && IsPasswordConfirmedCriterValid)
        }).map { result1, result2 in
            return (result1 && result2)
        }
        .assign(to: \.canSubmit, on: self)
        .store(in: &cancellableSet)
        
    }
}
