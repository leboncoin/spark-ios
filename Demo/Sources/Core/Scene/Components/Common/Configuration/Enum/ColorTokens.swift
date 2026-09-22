//
//  ColorTokens.swift
//  SparkDemo
//
//  Created by robin.lemaire on 09/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

enum ColorTokens: String, CaseIterable {
    case accent
    case accentContainer
    case accentVariant
    case alert
    case alertContainer
    case error
    case errorContainer
    case info
    case infoContainer
    case main
    case mainContainer
    case mainVariant
    case neutral
    case neutralContainer
    case success
    case successContainer
    case support
    case supportContainer
    case supportVariant

    // MARK: - Properties

    var value: any ColorToken {
        self.value()
    }

    // MARK: - Methods

    func value(_ configuration: ComponentConfiguration) -> any ColorToken {
        return self.value(configuration.theme.value)
    }

    private func value(_ theme: any SparkTheming.Theme = DemoThemes.shared.mainTheme.value) -> any ColorToken {
        let colors = theme.colors

        return switch self {
        case .accent: colors.accent.accent
        case .accentContainer: colors.accent.accentContainer
        case .accentVariant: colors.accent.accentVariant
        case .alert: colors.feedback.alert
        case .alertContainer: colors.feedback.alertContainer
        case .error: colors.feedback.error
        case .errorContainer: colors.feedback.errorContainer
        case .info: colors.feedback.info
        case .infoContainer: colors.feedback.infoContainer
        case .main: colors.main.main
        case .mainContainer: colors.main.mainContainer
        case .mainVariant: colors.main.mainVariant
        case .neutral: colors.feedback.neutral
        case .neutralContainer: colors.feedback.neutralContainer
        case .success: colors.feedback.success
        case .successContainer: colors.feedback.successContainer
        case .support: colors.support.support
        case .supportContainer: colors.support.supportContainer
        case .supportVariant: colors.support.supportVariant
        }
    }
}
