//
//  UIView+extensions.swift
//  RegisterACO
//
//  Created by Alex Apostol on 15/4/22.
//

import UIKit

class FreeSpaceView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
   convenience init() {
       self.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
