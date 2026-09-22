//
//  TextLinkDemoIntent.swift
//  SparkDemo
//
//  Created by robin.lemaire on 31/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

enum TextLinkDemoIntent: CaseIterable {
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

    static let `default`: Self = {
        switch TextLinkIntent.default {
        case .accent: .accent
        case .alert: .alert
        case .danger: .danger
        case .info: .info
        case .main: .main
        case .neutral: .neutral
        case .success: .success
        case .support: .support
        case .custom: .custom
        default: .custom
        }
    }()

    // MARK: - Methods

    func toRealType(_ configuration: TextLinkConfiguration) -> TextLinkIntent {
        switch self {
        case .accent: .accent
        case .alert: .alert
        case .danger: .danger
        case .info: .info
        case .main: .main
        case .neutral: .neutral
        case .success: .success
        case .support: .support
        case .custom: .custom(configuration.intentCustomColorToken.value(configuration))
        }
    }
}
