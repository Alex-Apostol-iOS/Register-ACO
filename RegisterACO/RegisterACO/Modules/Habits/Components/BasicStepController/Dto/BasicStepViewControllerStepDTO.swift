//
//  BasicStepViewControllerStepDTO.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 25/10/22.
//

import Foundation

struct BasicStepViewControllerStepDTO {
    let title: String
    let question1: String
    let answer1: String
    let question2: String
    let answer2: String
}

class BasicStepViewControllerStepDTOContainer {
    var stepData: [BasicStepViewControllerStepDTO] = []
}
