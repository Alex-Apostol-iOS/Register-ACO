//
//  HTTPHeadersHelper.swift
//  RegisterACO
//
//  Created by Alex Apostol on 21/5/22.
//

import Foundation
import Alamofire

@objc protocol HTTPHeadersHelper {
    @objc optional func buildLoginHeaders()
}

extension HTTPHeadersHelper {
    
   func  buildLoginHeaders() -> HTTPHeaders? {
        guard let email = try? KeychainHelper.sharedInstance.read(service: .user_email, account: .registerACO),
              let password = try? KeychainHelper.sharedInstance.read(service: .user_password, account: .registerACO) else { return nil}

       let loginData = String(format: "%@:%@", email, password)

       guard let loginDataUTF8 = loginData.data(using: String.Encoding.utf8) else
       {
           return nil
       }

       let base64LoginData = loginDataUTF8.base64EncodedString()

       let authenticationType = "Basic "+base64LoginData

       let headers = HTTPHeaders(
        [HTTPHeader(name: "Authorization", value: authenticationType)])

       return headers
    }
}
