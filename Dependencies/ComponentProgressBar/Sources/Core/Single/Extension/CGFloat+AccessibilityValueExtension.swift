//
//  CGFloat+AccessibilityValueExtension.swift
//  SparkComponentProgressBar
//
//  Created by robin.lemaire on 18/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

extension CGFloat {

    var accessibilityValue: String {
        "\(Int(self * 100.0))%"
    }
}
