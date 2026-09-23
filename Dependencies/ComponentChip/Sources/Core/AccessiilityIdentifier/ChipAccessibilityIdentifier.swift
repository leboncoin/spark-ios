//
//  ChipAccessibilityIdentifier.swift
//  SparkComponentChip
//
//  Created by michael.zimmermann on 20.09.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

/// The accessibility identifiers for the chip.
public enum ChipAccessibilityIdentifier {

    // MARK: - Properties

    /// The accessibility identifier.
    @available(*, deprecated, message: "Use view instead")
    public static let identifier = "spark-chip"
    /// The accessibility identifier.
    public static let view = "spark-chip"
    /// The text label accessibility identifier.
    public static let text = "spark-chip-text"
    /// The icon  accessibility identifier.
    public static let icon = "spark-chip-icon"
}
