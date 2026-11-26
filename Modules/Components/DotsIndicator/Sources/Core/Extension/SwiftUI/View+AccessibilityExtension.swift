//
//  View+AccessibilityExtension.swift
//  SparkComponentDotsIndicator
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension View {

    func dotsIndicatorAccessibility(
        isInteractive: Bool,
        numberOfPages: Int,
        currentPage: Binding<Int>
    ) -> some View {
        self.accessibilityElement(children: .ignore)
            .accessibilityIdentifier(DotsIndicatorAccessibilityIdentifier.view)
            .accessibilityValue(String.accessibilityDotsIndicatorValue(
                currentPage: currentPage.wrappedValue.clampedPage(numberOfPages: numberOfPages),
                numberOfPages: numberOfPages
            ))
            .dotsIndicatorAdjustableAction(
                isInteractive: isInteractive,
                numberOfPages: numberOfPages,
                currentPage: currentPage
            )
    }

    @ViewBuilder
    private func dotsIndicatorAdjustableAction(
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
