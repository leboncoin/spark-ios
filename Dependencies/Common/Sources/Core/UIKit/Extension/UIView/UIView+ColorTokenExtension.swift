//
//  UIView+ColorTokenExtension.swift
//  SparkCommon
//
//  Created by robin.lemaire on 30/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SparkTheming

public extension UIView {

    /// Set a **backgroundColor** color on UIView from a Spark **ColorToken**.
    /// - Parameters:
    ///   - token: the color token.
    func backgroundColor(_ token: (any ColorToken)?) {
        self.backgroundColor = token?.uiColor
    }
}
