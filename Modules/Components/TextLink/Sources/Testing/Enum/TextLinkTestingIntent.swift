//
//  TextLinkTestingIntent.swift
//  SparkComponentTextLink
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@testable import SparkComponentTextLink
import SparkTheming

@_spi(SI_SPI) public enum TextLinkTestingIntent: CaseIterable {
    case accent
    case alert
    case danger
    case info
    case main
    case neutral
    case success
    case support
    case custom

    // MARK: - Properties

    /// The default case. Equals to **.support**.
    public static let `default`: Self = .support

    // MARK: - Methods

    public func toType(_ theme: any Theme) -> TextLinkIntent {
        switch self {
        case .accent: .accent
        case .alert: .alert
        case .danger: .danger
        case .info: .info
        case .main: .main
        case .neutral: .neutral
        case .success: .success
        case .support: .support
        case .custom: .custom(theme.colors.accent.accentContainer)
        }
    }
}
