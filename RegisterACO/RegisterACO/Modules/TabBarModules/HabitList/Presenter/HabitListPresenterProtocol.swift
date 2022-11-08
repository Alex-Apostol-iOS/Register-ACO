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
    func didTapCell(item: DtoPostiveHabit)
    func buildHabitDetailModel(from item: DtoPostiveHabit ) -> BasicDetailViewDataModel
}
