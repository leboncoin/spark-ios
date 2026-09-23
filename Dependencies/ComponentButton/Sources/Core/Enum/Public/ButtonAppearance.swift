//
//  ButtonAppearance.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 17/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

/// A button intent is used to apply a color scheme to a button.
@frozen
public enum ButtonAppearance: CaseIterable {
    /// Main action with filled background
    case primary
    /// secondary: Secondary action with support color
    case secondary
    /// tertiary: Tertiary action with outlined surface
    case tertiary
    /// contrast: Contrast action with surface background
    case contrast
    /// ghost: Link-style without background
    case ghost
    /// success: Success action with outlined style
    case success
    /// danger: Danger action with outlined style
    case danger
    /// boost: Accent action with filled accent background
    case boost
    /// AI: AI action with filled AI background
    case ai

    // MARK: - Properties

    /// The defautl value. Equals to **.primary**
    public static let `default`: ButtonAppearance = .primary

    // MARK: - Initialization

    @available(*, deprecated, message: "Should be removed ASAP (25/07/26)")
    init?(
        intent: ButtonIntent,
        variant: ButtonVariant
    ) {
        self = switch (intent, variant) {
        // Main
        case (.main, .filled): .primary
        case (.main, .outlined), (.main, .tinted): .tertiary
        case (.main, .ghost): .ghost
        case (.main, .contrast): .contrast

        // Support
        case (.support, .filled): .secondary
        case (.support, .outlined), (.support, .tinted): .tertiary
        case (.support, .ghost): .ghost
        case (.support, .contrast): .contrast

        // Success
        case (.success, .filled), (.success, .outlined), (.success, .tinted): .success
        case (.success, .ghost): .ghost
        case (.success, .contrast): .contrast

        // Danger
        case (.danger, .filled), (.danger, .outlined), (.danger, .tinted): .danger
        case (.danger, .ghost): .ghost
        case (.danger, .contrast): .contrast

        // Info
        case (.info, .filled), (.info, .outlined), (.info, .tinted): .tertiary
        case (.info, .ghost): .ghost
        case (.info, .contrast): .contrast

        // Alert
        case (.alert, .filled), (.alert, .outlined), (.alert, .tinted): .tertiary
        case (.alert, .ghost): .ghost
        case (.alert, .contrast): .contrast

        // Neutral
        case (.neutral, .filled), (.neutral, .outlined), (.neutral, .tinted): .tertiary
        case (.neutral, .ghost): .ghost
        case (.neutral, .contrast): .contrast

        // Surface
        case (.surface, .filled), (.surface, .outlined): .contrast
        case (.surface, .ghost): .ghost

        // Accent
        case (.accent, .filled): .boost
        case (.accent, .outlined), (.accent, .tinted): .tertiary
        case (.accent, .ghost): .ghost
        case (.accent, .contrast): .contrast

        // AI
        case (.ai, .filled), (.ai, .outlined), (.ai, .tinted), (.ai, .ghost), (.ai, .contrast): .ai

        // Surface-inverse (to define - use tertiary as fallback)
        case (.surfaceInverse, _): .tertiary

        default: .tertiary
        }
    }
}
