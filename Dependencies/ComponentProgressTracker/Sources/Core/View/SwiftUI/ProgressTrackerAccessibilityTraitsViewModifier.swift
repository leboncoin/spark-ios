//
//  ProgressTrackerAccessibilityTraitsViewModifier.swift
//  SparkComponentProgressTracker
//
//  Created by Michael Zimmermann on 11.04.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Foundation
import SwiftUI

struct ProgressTrackerAccessibilityTraitsViewModifier: ViewModifier {
    typealias AccessibilityIdentifier = ProgressTrackerAccessibilityIdentifier

    private let viewModel: ProgressTrackerViewModel<ProgressTrackerIndicatorContent>
    private let index: Int

    init(viewModel: ProgressTrackerViewModel<ProgressTrackerIndicatorContent>, index: Int) {
        self.viewModel = viewModel
        self.index = index
    }

    func body(content: Content) -> some View {
        return content
            .accessibilityElement(children: .combine)
            .accessibilityRemoveTraits([.isButton, .isStaticText])
            .accessibilityAddTraits(self.getAccessibilityTraits(index: self.index))
            .accessibilityIdentifier(AccessibilityIdentifier.indicator(forIndex: self.index))
            .accessibilityValue("\(self.index)")
    }

    private func getAccessibilityTraits(index: Int) -> AccessibilityTraits {

        var accessibilityTraits: AccessibilityTraits = AccessibilityTraits()

        if self.viewModel.interactionState != .none {
            _ = accessibilityTraits.insert(.isButton)
        } else {
            _ = accessibilityTraits.insert(.isStaticText)
        }
        if index == self.viewModel.currentPageIndex {
            _ = accessibilityTraits.insert(.isSelected)
        }

        return accessibilityTraits
    }

}
