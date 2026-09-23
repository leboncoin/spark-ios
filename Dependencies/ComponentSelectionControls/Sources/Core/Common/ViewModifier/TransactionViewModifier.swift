//
//  TransactionViewModifier.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 29/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

private struct TransactionViewModifier: ViewModifier {

    // MARK: - Properties

    let isAnimated: Bool

    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    // MARK: - Initialization

    func body(content: Content) -> some View {
        content
            .transaction {
                if !self.isAnimated || self.reduceMotion {
                    $0.animation = nil
                }
            }
    }
}

// MARK: - Extension

extension View {

    func transaction(isAnimated: Bool = true) -> some View {
        self.modifier(TransactionViewModifier(
            isAnimated: isAnimated
        ))
    }
}
