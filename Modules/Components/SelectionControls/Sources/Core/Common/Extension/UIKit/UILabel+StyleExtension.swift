//
//  UILabel+StyleExtension.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 08/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit

extension UILabel {

    func applyStyle() {
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
        self.textAlignment = .left
        self.adjustsFontForContentSizeCategory = true
        self.setContentCompressionResistancePriority(
            .required,
            for: .vertical
        )
        self.isUserInteractionEnabled = false
        self.isAccessibilityElement = false
        self.isHidden = true
    }
}
