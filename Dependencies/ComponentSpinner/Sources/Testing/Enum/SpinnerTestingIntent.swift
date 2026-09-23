//
//  SpinnerTestingIntent.swift
//  SparkComponentSpinnerSnapshotTests
//
//  Created by robin.lemaire on 10/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@testable import SparkComponentSpinner
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@_spi(SI_SPI) public enum SpinnerTestingIntent: CaseIterable {
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

    public static let `default`: Self = .support

    // MARK: - Initialization

    init(intent: SpinnerIntent) {
        self = switch intent {
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
    }

    // MARK: - Methods

    public func toIntent(_ theme: any Theme) -> SpinnerIntent {
        switch self {
        case .accent: .accent
        case .alert: .alert
        case .error: .error
        case .info: .info
        case .main: .main
        case .neutral: .neutral
        case .success: .success
        case .support: .support
        case .custom: .custom(ColorTokenGeneratedMock.green())
        }
    }
}
