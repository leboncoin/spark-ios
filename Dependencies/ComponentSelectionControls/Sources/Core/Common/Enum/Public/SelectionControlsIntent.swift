//
//  SelectionControlsIntent.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 22/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

/// Enum describing intent options for selection controls.
public enum SelectionControlsIntent: String, CaseIterable {
    case support
    case error

    // MARK: - Properties

    /// The default case. Equals to **.support**.
    public static let `default`: Self = .support
}
