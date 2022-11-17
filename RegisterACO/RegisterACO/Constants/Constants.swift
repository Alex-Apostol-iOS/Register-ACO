//
//  Constants.swift
//  RegisterACO
//
//  Created by Alex Apostol on 16/5/22.
//

import Foundation

enum Constants: String {
    case emailPredicate =  "[a-zA-Z0-9\\+\\.\\_\\%\\-\\+]{1,256}[\\@]{1}[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}([\\.]{1}[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25})+"
    
    case passwordPredicate = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$"
    
    case noEmptyStringPredicate = "^(?!\\s*$).+"
    
    case  spanishphoneStringPredicate = "^[679]{1}[0-9]{8}$"
}
