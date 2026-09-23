//
//  UILabel+TextColorExtension.swift
//  SparkCommon
//
//  Created by robin.lemaire on 30/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SparkTheming

public extension UILabel {

    /// Set a **textColor** color on UILabel from a Spark **ColorToken**.
    /// - Parameters:
    ///   - token: the color token.
    func textColor(_ token: any ColorToken) {
        self.textColor = token.uiColor
    }
}
