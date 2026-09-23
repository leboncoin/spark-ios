//
//  CheckboxSelectionState.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 31/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

/// Enum describing Checkbox selection states.
@frozen
public enum CheckboxSelectionState: CaseIterable {
    /// Checkbox is selected.
    case selected
    /// Checkbox is partly selected (indeterminate). (E.g. of a given category only a subset of sub-categories is selected.)
    case indeterminate
    /// Checkbox is unselected.
    case unselected

    // MARK: - Properties

    /// The default case. Equals to **.unselected**.
    public static let `default`: Self = .unselected
}
