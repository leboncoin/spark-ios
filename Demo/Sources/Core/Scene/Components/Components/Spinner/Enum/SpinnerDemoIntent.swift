//
//  SpinnerDemoIntent.swift
//  SparkDemo
//
//  Created by robin.lemaire on 11/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

enum SpinnerDemoIntent: CaseIterable {
    case accent
    case alert
    case error
    case info
    case main
    case neutral
    case success
    case support
    case custom

    // MARK: - Properties

    static let `default`: Self = {
        switch IconIntent.default {
        case .accent: .accent
        case .alert: .alert
        case .error: .error
        case .info: .info
        case .main: .main
        case .neutral: .neutral
        case .success: .success
        case .support: .support
        case .custom: .custom
        }
    }()

    // MARK: - Methods

    func toRealType(_ configuration: SpinnerConfiguration) -> SpinnerIntent {
        switch self {
        case .accent: .accent
        case .alert: .alert
        case .error: .error
        case .info: .info
        case .main: .main
        case .neutral: .neutral
        case .success: .success
        case .support: .support
        case .custom: .custom(configuration.intentCustomColorToken.value(configuration))
        }
    }
}
