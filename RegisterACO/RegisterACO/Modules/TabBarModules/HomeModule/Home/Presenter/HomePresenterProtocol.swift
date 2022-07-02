//
//  HomePresenterProtocol.swift
//  RegisterACO
//
//  Created by Alex Apostol on 7/5/22.
//  
//

import Foundation

protocol HomePresenterProtocol: AnyObject, GetLabel {
    func viewDidLoad()
    func didTapPositiveHabitCard()
}
