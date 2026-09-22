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

    /// Set a **font**  on UILabel from a Spark **TypographyFontToken**.
    /// - Parameters:
    ///   - typography: the typography token.
    func font(_ typography: any TypographyFontToken) {
        self.font = typography.uiFont
    }
}
