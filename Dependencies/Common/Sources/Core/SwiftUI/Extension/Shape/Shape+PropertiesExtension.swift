//
//  Shape+PropertiesExtension.swift
//  SparkCommon
//
//  Created by robin.lemaire on 29/09/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming

@_spi(SI_SPI) public extension Shape {

    /// Add fill color from an color token.
    /// - Parameters:
    ///   - fillColorToken: fill color token of the rectangle. If color token is the, fill is .clear
    func fill(_ fillColorToken: (any ColorToken)?) -> some View {
        self.fill(fillColorToken?.color ?? .clear)
    }
}
