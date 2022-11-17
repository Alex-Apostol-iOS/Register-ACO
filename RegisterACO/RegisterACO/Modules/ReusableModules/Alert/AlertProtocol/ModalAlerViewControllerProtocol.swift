//
//  ModalAlerViewControllerProtocol.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 22/10/22.
//

import UIKit

protocol ModalAlerViewControllerProtocol: AnyObject {
    func showAlert(with model: AlertViewModel)
    func hideAlert()
}

extension ModalAlerViewControllerProtocol where Self: UIViewController {
    
    func showAlert(with model: AlertViewModel) {

        let vc = AlertViewController(with: model)
        
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .coverVertical
        self.present(vc, animated: true, completion: nil)
    }
    
    func hideAlert() {
        guard let topViewController = self.presentedViewController as? AlertViewController else {return}
        topViewController.dismiss(animated: true)
    }
}
