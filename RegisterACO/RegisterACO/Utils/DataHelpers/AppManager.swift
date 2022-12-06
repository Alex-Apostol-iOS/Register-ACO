//
//  AppManager.swift
//  RegisterACO
//
//  Created by Alex Apostol on 2/5/22.
//

import Foundation


class AppManager {
     let serviceProxy = ServiceProxy()
    static let sharedInstace = AppManager()
     let coreData = CoreDateController()
}
