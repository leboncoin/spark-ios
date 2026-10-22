//
//  SnapshotNameBuilder.swift
//  SparkSnapshotTesting
//
//  Created by janniklas.freundt.ext on 13.04.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import UIKit

enum SnapshotNameBuilder {

    // MARK: - Methods

    static func make(
        _ name: String?,
        mode: ComponentSnapshotTestMode,
        size: UIContentSizeCategory,
        forDocumentation: Bool = false
    ) -> String {
        let components = forDocumentation
            ? [name, mode.rawValue, "retina"]
            : [name, mode.suffix, size.identifier]

        return components
            .compactMap { $0 }
            .joined(separator: "-")
    }
}

// MARK: - Private extension

private extension UIContentSizeCategory {
    /// Returns the identifier used in the filename
    var identifier: String {
        return switch self {
        case .unspecified: "unspecified"
        case .extraSmall: "extraSmall"
        case .small: "small"
        case .medium: "medium"
        case .large: "large"
        case .extraLarge: "extraLarge"
        case .extraExtraLarge: "extraExtraLarge"
        case .extraExtraExtraLarge: "extraExtraExtraLarge"
        case .accessibilityMedium: "accessibilityMedium"
        case .accessibilityLarge: "accessibilityLarge"
        case .accessibilityExtraLarge: "accessibilityExtraLarge"
        case .accessibilityExtraExtraLarge: "accessibilityExtraExtraLarge"
        case .accessibilityExtraExtraExtraLarge: "accessibilityExtraExtraExtraLarge"
        default: "unknown"
        }
    }
}
