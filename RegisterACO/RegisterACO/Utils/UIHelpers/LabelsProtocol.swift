//
//  LabelsProtocol.swift
//  RegisterACO
//
//  Created by Alex Apostol on 16/4/22.
//

import Foundation

protocol GetLabel {
    func getlabelForKey(key: String) -> String
}

extension GetLabel {
    func getlabelForKey(key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }
}


extension String {
    var localized: String
    {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
