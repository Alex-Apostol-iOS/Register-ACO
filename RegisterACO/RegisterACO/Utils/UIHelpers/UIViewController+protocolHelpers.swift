//
//  UIViewController+protocolHelpers.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 19/11/22.
//

import UIKit

protocol ShowToastAlert: AnyObject {
    func showToast(message: String, type: ToastType)
    func showGenericErrorToastMessage()
}

extension ShowToastAlert where Self: UIViewController {
    func showToast(message: String, type: ToastType) {
        DispatchQueue.main.async {
            Toast.show(message: message, controller: self, type: type)
        }
    }
    
    func showGenericErrorToastMessage() {
        DispatchQueue.main.async {
            Toast.show(message: "lng.common.error.toast.message".localized, controller: self, type: .error)
        }
    }
}
