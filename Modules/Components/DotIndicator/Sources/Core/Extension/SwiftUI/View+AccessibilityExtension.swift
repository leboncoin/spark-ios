//
//  View+AccessibilityExtension.swift
//  SparkComponentDotIndicator
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension View {

    func dotIndicatorAccessibility(
        isInteractive: Bool,
        numberOfPages: Int,
        currentPage: Binding<Int>
    ) -> some View {
        self.accessibilityElement(children: .ignore)
            .accessibilityIdentifier(DotIndicatorAccessibilityIdentifier.view)
            .accessibilityValue(String.accessibilityDotIndicatorValue(
                currentPage: currentPage.wrappedValue.clampedPage(numberOfPages: numberOfPages),
                numberOfPages: numberOfPages
            ))
            .dotIndicatorAdjustableAction(
                isInteractive: isInteractive,
                numberOfPages: numberOfPages,
                currentPage: currentPage
            )
    }

    @ViewBuilder
    private func dotIndicatorAdjustableAction(
        isInteractive: Bool,
        numberOfPages: Int,
        currentPage: Binding<Int>
    ) -> some View {
        if isInteractive {
            self.accessibilityAdjustableAction { direction in
                switch direction {
                case .increment:
                    currentPage.wrappedValue = currentPage.wrappedValue.nextPage(numberOfPages: numberOfPages)
                case .decrement:
                    currentPage.wrappedValue = currentPage.wrappedValue.previousPage(numberOfPages: numberOfPages)
                @unknown default:
                    break
                }
            }
        } else {
            self
        }
    }
}
