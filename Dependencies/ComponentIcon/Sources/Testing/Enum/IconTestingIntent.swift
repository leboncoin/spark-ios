//
//  IconTestingIntent.swift
//  SparkComponentIconSnapshotTests
//
//  Created by robin.lemaire on 02/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@testable import SparkComponentIcon
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@_spi(SI_SPI) public enum IconTestingIntent: CaseIterable {
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

    // MARK: - Methods

    public func toIntent(_ theme: any Theme) -> IconIntent {
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
