//
//  CheckboxAccessibilityIdentifier.swift
//  SparkComponentSelectionControls
//
//  Created by michael.zimmermann on 14.04.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

public enum CheckboxAccessibilityIdentifier {

    // MARK: - Properties

    /// The checkbox view accessibility identifier.
    public static let view = "spark-checkbox"
    /// The checkbox group view accessibility identifier.
    public static let group = "spark-checkbox-group"
    /// The toggle view accessibility identifier.
    public static let toggleView = "spark-checkbox-toggleView"
    /// The radio button text label accessibility identifier.
    public static let checkboxTextLabel = "spark-radio-button-text-label"
    /// The text accessibility identifier.
    public static let text = "spark-checkbox-text"

    // MARK: - Methods

    /// The item accessibility identifier on checkbox group.
    public static func checkboxItem<ID: CustomStringConvertible>(id: ID) -> String {
        return "\(self.view)-\(id)"
    }
}
