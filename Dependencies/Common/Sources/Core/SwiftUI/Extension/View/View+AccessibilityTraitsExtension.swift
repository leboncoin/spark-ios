//
//  View+AccessibilityTraitsExtension.swift
//  SparkCommon
//
//  Created by robin.lemaire on 29/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

@_spi(SI_SPI) public extension View {

    /// Add a traits if the condition is true otherwise remove the traits.
    @ViewBuilder
    func accessibilityAddTraits(_ traits: AccessibilityTraits, condition value: Bool) -> some View {
        if value {
            self.accessibilityAddTraits(traits)
        } else {
            self.accessibilityRemoveTraits(traits)
        }
    }
}
