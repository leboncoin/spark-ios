//
//  Text+ColorTokenExtension.swift
//  SparkCommon
//
//  Created by robin.lemaire on 20/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming

@_spi(SI_SPI) public extension Text {

    /// Set a foreground color on Text from a Spark **ColorToken**.
    /// - Parameters:
    ///   - color: the color token.
    func foregroundColor(_ color: (any ColorToken)?) -> Text {
        self.foregroundColor(color?.color)
    }
}
