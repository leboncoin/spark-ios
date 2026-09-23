//
//  ComponentSnapshotTestHelpers.swift
//  SparkCoreSnapshotTests
//
//  Created by robin.lemaire on 06/10/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import UIKit

@_spi(SI_SPI) @frozen public enum ComponentSnapshotTestHelpers {

    // MARK: - Helpers

    public static func name(
        _ name: String?,
        mode: ComponentSnapshotTestMode,
        size: UIContentSizeCategory,
        forDocumentation: Bool = false
    ) -> String {
        if forDocumentation {
            return [name, mode.rawValue, "retina"]
                .compactMap { $0 }
                .joined(separator: "-")
        } else {
            return [name, mode.suffix, size.identifier]
                .compactMap { $0 }
                .joined(separator: "-")
        }
    }

    public static func traitCollection(
        mode: ComponentSnapshotTestMode,
        size: UIContentSizeCategory
    ) -> UITraitCollection {
        return UITraitCollection(traitsFrom: [
            mode.traitCollection,
            UITraitCollection(preferredContentSizeCategory: size)
        ])
    }
}

// MARK: - Private extension

private extension UIContentSizeCategory {
    /// Returns the identifier used in the filename
    var identifier: String {
        switch self {
        case .unspecified:
            return "unspecified"
        case .extraSmall:
            return "extraSmall"
        case .small:
            return "small"
        case .medium:
            return "medium"
        case .large:
            return "large"
        case .extraLarge:
            return "extraLarge"
        case .extraExtraLarge:
            return "extraExtraLarge"
        case .extraExtraExtraLarge:
            return "extraExtraExtraLarge"
        case .accessibilityMedium:
            return "accessibilityMedium"
        case .accessibilityLarge:
            return "accessibilityLarge"
        case .accessibilityExtraLarge:
            return "accessibilityExtraLarge"
        case .accessibilityExtraExtraLarge:
            return "accessibilityExtraExtraLarge"
        case .accessibilityExtraExtraExtraLarge:
            return "accessibilityExtraExtraExtraLarge"
        default:
            return "unknown"
        }
    }
}

