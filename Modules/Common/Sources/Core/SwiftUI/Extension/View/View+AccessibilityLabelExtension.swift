//
//  View+AccessibilityLabelExtension.swift
//  SparkCommon
//
//  Created by robin.lemaire on 10/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

@_spi(SI_SPI) public extension View {

    @ViewBuilder
    func accessibilityLabel(optional value: String?) -> some View {
        if let value {
            self.accessibilityLabel(value)
        } else {
            self
        }
    }
}
