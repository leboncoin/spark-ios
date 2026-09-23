//
//  TextLinkIntent.swift
//  SparkComponentTextLink
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SparkTheming

/// The intent of the text link.
public enum TextLinkIntent: Equatable {
    case accent
    case alert
    case danger
    case info
    case main
    case neutral
    case success
    case support

    /// Use a custom color token. **Use it carefully**.
    case custom(_ colorToken: any ColorToken)

    @available(*, deprecated, message: "Use .custom instead.")
    case accentContainer
    @available(*, deprecated, message: "Use .custom instead.")
    case onAccentContainer
    @available(*, deprecated, message: "Use .custom instead.")
    case alertContainer
    @available(*, deprecated, message: "Use .custom instead.")
    case dangerContainer
    @available(*, deprecated, message: "Use .custom instead.")
    case infoContainer
    @available(*, deprecated, message: "Use .custom instead.")
    case mainContainer
    @available(*, deprecated, message: "Use .custom instead.")
    case neutralContainer
    @available(*, deprecated, message: "Use surface instead.")
    case surface
    @available(*, deprecated, message: "Use surface instead.")
    case onSurface
    @available(*, deprecated, message: "Use .custom instead.")
    case successContainer
    @available(*, deprecated, message: "Use .custom instead.")
    case supportContainer

    // MARK: - Properties

    /// The default case. Equals to **.support**.
    public static let `default`: Self = .support

    // MARK: - Equatable

    public static func == (lhs: TextLinkIntent, rhs: TextLinkIntent) -> Bool {
        return switch (lhs, rhs) {
        case (.accent, .accent): true
        case (.alert, .alert): true
        case (.danger, .danger): true
        case (.info, .info): true
        case (.main, .main): true
        case (.neutral, .neutral): true
        case (.success, .success): true
        case (.support, .support): true
        case (.accentContainer, .accentContainer): true
        case (.onAccentContainer, .onAccentContainer): true
        case (.alertContainer, .alertContainer): true
        case (.dangerContainer, .dangerContainer): true
        case (.infoContainer, .infoContainer): true
        case (.mainContainer, .mainContainer): true
        case (.neutralContainer, .neutralContainer): true
        case (.surface, .surface): true
        case (.onSurface, .onSurface): true
        case (.successContainer, .successContainer): true
        case (.supportContainer, .supportContainer): true
        case (.custom(let lhsValue), .custom(let rhsValue)):
            lhsValue.equals(rhsValue)
        default: false
        }
    }
}
