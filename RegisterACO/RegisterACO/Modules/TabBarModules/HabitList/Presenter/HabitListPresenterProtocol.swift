//
//  HabitListPresenterProtocol.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 31/10/22.
//  
//

import Foundation

protocol HabitListPresenterProtocol: AnyObject {
    func viewDidLoad()
    func buildListItemModel(from postiveHabit: DtoPostiveHabit) -> HabitListViewModel
}
