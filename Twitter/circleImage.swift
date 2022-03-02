//
//  circleImage.swift
//  Twitter
//
//  Created by Harshad Barapatre on 2/27/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import Foundation
import SwiftUI

extension UIImageView {
    func roundedImage() {
        self.layer.cornerRadius = (self.frame.size.width) / 2;
        self.clipsToBounds = true
        self.layer.borderWidth = 0.0
        self.layer.borderColor = UIColor.white.cgColor
    }
}
