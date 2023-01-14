//
//  HabitListViewControllerProtocol.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 31/10/22.
//  
//

import UIKit

//sourcery: AutoMockable
protocol HabitListViewProtocol: Loader, ShowToastAlert {
    func layout(with content: [DtoPostiveHabit])
}
