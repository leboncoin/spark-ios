//
//  SpinnerAccessibilityIdentifier.swift
//  SparkComponentSpinner
//
//  Created by michael.zimmermann on 13.07.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

/// The accessibility identifiers for the spinner.
public enum SpinnerAccessibilityIdentifier {

    // MARK: - Properties

    /// The text label accessibility identifier.
    @available(*, deprecated, message: "Use SpinnerAccessibilityIdentifier.view instead")
    public static let spinner = "spark-spinner"

    /// The text label accessibility identifier.
    public static let view = "spark-spinner"
}
