//
//  BasicStepViewModel.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 25/10/22.
//

import Combine
import Foundation

class BasicStepViewModel {
    @Published var firstTextField = ""
    @Published var secondTextField = ""
    
    var cancellableSet: Set<AnyCancellable> = []
    
    private let noEmptyStringPredicate = NSPredicate(format: "SELF MATCHES %@", Constants.noEmptyStringPredicate.rawValue)
    
     var validateFirstsSurnameAndPhone: AnyPublisher<Bool, Never> {
         return Publishers.CombineLatest($firstTextField, $secondTextField)
             .receive(on: RunLoop.main)
             .map { firstTextField, secondTextField in
                 return  self.noEmptyStringPredicate.evaluate(with: firstTextField) && self.noEmptyStringPredicate.evaluate(with: secondTextField)
             }.eraseToAnyPublisher()
     }
    
    init() {}
}
