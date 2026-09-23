//
//  AccessibilityChildViewModifier.swift
//  SparkCommon
//
//  Created by robin.lemaire on 16/12/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import SwiftUI

private struct AccessibilityChildViewModifier: ViewModifier {

    // MARK: - Properties

    private let accessibility: Accessibility

    // MARK: - Initialization

    init(accessibility: Accessibility) {
        self.accessibility = accessibility
    }

    // MARK: - Content

    func body(content: Content) -> some View {
        content.optionalAccessibilityLabel(self.accessibility.label)
            .optionalAccessibilityValue(self.accessibility.value)
            .optionalAccessibilityInputLabels(self.accessibility.inputLabels)
            .optionalAccessibilityHint(self.accessibility.hint)
            .optionalAccessibilityHidden(self.accessibility.hidden)
            .optionalAccessibilityAction(self.accessibility.action)
    }
}

// MARK: - Public Extension

@_spi(SI_SPI) public extension View {

    /// Add some accessibility properties from struct.
    /// - Parameters:
    ///   - accessibility: the accessibility properties struct.
    func accessibility(_ accessibility: Accessibility) -> some View {
        self.modifier(AccessibilityChildViewModifier(accessibility: accessibility))
    }
}

// MARK: - Private Extension

private extension View {

    @ViewBuilder
    func optionalAccessibilityLabel(_ label: String?) -> some View {
        if let label {
            self.accessibilityLabel(label)
        } else {
            self
        }
    }

    @ViewBuilder
    func optionalAccessibilityValue(_ value: String?) -> some View {
        if let value {
            self.accessibilityValue(value)
        } else {
            self
        }
    }

    @ViewBuilder
    func optionalAccessibilityInputLabels(_ inputLabels: [String]?) -> some View {
        if let inputLabels {
            self.accessibilityInputLabels(inputLabels)
        } else {
            self
        }
    }

    @ViewBuilder
    func optionalAccessibilityHint(_ hint: String?) -> some View {
        if let hint {
            self.accessibilityHint(hint)
        } else {
            self
        }
    }

    @ViewBuilder
    func optionalAccessibilityHidden(_ hidden: Bool?) -> some View {
        if let hidden {
            self.accessibilityHidden(hidden)
        } else {
            self
        }
    }

    @ViewBuilder
    func optionalAccessibilityAction(_ action: Accessibility.Action?) -> some View {
        if let action {
            self.accessibilityAction(named: action.name, action.handler)
        } else {
            self
        }
    }
}
