//
//  UIImageView+Extensions.swift
//  RegisterACO
//
//  Created by Alex Apostol on 12/6/22.
//

import UIKit
import SDWebImage

extension UIImageView {
    
    func loadImage(imageUrl: String, placeHolder: String?) {
        if let url = URL(string: imageUrl) {
            self.sd_setImage(with: url) { image, error, cache, url in
                if let _ = error {
                    if let image = UIImage(named: imageUrl) {
                        self.image = image
                    }
                }
            }
        }
    }
}
