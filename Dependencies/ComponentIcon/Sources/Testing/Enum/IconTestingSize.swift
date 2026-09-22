//
//  IconTestingSize.swift
//  SparkComponentIconSnapshotTests
//
//  Created by robin.lemaire on 02/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@testable import SparkComponentIcon

@_spi(SI_SPI) public enum IconTestingSize: CaseIterable {
    case small
    case medium
    case large
    case extraLarge
    case custom

    // MARK: - Properties

    public static let `default`: Self = .medium

    public var toSize: IconSize {
        switch self {
        case .small: .small
        case .medium: .medium
        case .large: .large
        case .extraLarge: .extraLarge
        case .custom: .custom(23)
        }
    }
}
