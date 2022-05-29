//
//  AlertViewModel.swift
//  RegisterACO
//
//  Created by Alex Apostol on 29/5/22.
//

import Foundation

struct AlertViewModel {
    let title: String
    let subtitle: String
    let mainButtonTitle: String
    let secondaryButttonTitle: String
    let mainButtonAction: () -> Void
    var secondaryButtonAction: (() -> Void)?
}
