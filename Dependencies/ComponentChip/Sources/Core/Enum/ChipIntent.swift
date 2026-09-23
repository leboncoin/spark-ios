//
//  ChipIntentColor.swift
//  SparkComponentChip
//
//  Created by michael.zimmermann on 02.05.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

/// The various intent color a chip may have.
public enum ChipIntent: CaseIterable {
    case danger
    case main
    case neutral
    case support
    case surface

    @available(*, deprecated, message: "This intent is deprecated and will be removed in a future version.")
    case accent
    @available(*, deprecated, message: "This intent is deprecated and will be removed in a future version.")
    case alert
    @available(*, deprecated, message: "This intent is deprecated and will be removed in a future version.")
    case info
    @available(*, deprecated, message: "This intent is deprecated and will be removed in a future version.")
    case success

    // MARK: - Properties

    /// The default case. Equals to **.support**.
    public static let `default`: Self = .support

    /// All non-deprecated cases.
    public static var allCases: [ChipIntent] {
        return [.danger, .main, .neutral, .support, .surface]
    }
}
