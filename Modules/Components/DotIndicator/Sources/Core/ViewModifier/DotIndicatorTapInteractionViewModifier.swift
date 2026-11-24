//
//  DotIndicatorTapInteractionViewModifier.swift
//  SparkComponentDotIndicator
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

private struct DotIndicatorTapInteractionViewModifier: ViewModifier {

    // MARK: - Properties

    let isInteractive: Bool
    let numberOfPages: Int
    @Binding var currentPage: Int

    @Environment(\.dotIndicatorSize) private var size
    @Environment(\.isEnabled) private var isEnabled

    private var hasTapInteraction: Bool {
        self.isInteractive && self.size.hasTapInteraction && self.isEnabled
    }

    // MARK: - View

    func body(content: Content) -> some View {
        if self.hasTapInteraction {
            content
                .overlay {
                    HStack(spacing: 0) {
                        self.tapArea {
                            self.currentPage = self.currentPage.previousPage(numberOfPages: self.numberOfPages)
                        }

                        self.tapArea {
                            self.currentPage = self.currentPage.nextPage(numberOfPages: self.numberOfPages)
                        }
                    }
                }
        } else {
            content
        }
    }

    // MARK: - Subview

    private func tapArea(action: @escaping () -> Void) -> some View {
        Color.clear
            .contentShape(Rectangle())
            .onTapGesture(perform: action)
    }
}

extension View {

    func dotIndicatorTapInteraction(
        isInteractive: Bool,
        numberOfPages: Int,
        currentPage: Binding<Int>
    ) -> some View {
        self.modifier(DotIndicatorTapInteractionViewModifier(
            isInteractive: isInteractive,
            numberOfPages: numberOfPages,
            currentPage: currentPage
        ))
    }
}
