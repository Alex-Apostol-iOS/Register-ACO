//
//  UIView+extensions.swift
//  RegisterACO
//
//  Created by Alex Apostol on 15/4/22.
//

import UIKit
import SwiftUI

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

extension UIView {
    func setUpVerticalGradient(colors: CGColor..., cornerRadius: CGFloat = 0) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = colors
        gradientLayer.cornerRadius = cornerRadius
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setUpHorizontalGradient(colors: CGColor..., cornerRadius: CGFloat = 0) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = colors
        gradientLayer.cornerRadius = cornerRadius
        // Set start point.
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)

        // Set end point.
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}

struct ViewPreview: UIViewRepresentable {
    let viewBuilder: () -> UIView

    init(_ viewBuilder: @escaping () -> UIView) {
        self.viewBuilder = viewBuilder
    }

    func makeUIView(context: Context) -> some UIView {
        viewBuilder()
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        // Nothing here
    }
}
