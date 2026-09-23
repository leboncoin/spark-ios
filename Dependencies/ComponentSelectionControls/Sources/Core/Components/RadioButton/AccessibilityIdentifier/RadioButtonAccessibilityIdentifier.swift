//
//  RadioButtonAccessibilityIdentifier.swift
//  SparkComponentSelectionControls
//
//  Created by michael.zimmermann on 14.04.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

public enum RadioButtonAccessibilityIdentifier {

    // MARK: - Properties

    /// The radio button view accessibility identifier.
    public static let view = "spark-radio-button"
    /// The radio group view accessibility identifier.
    public static let group = "spark-radio-group"
    /// The toggle view accessibility identifier.
    public static let toggleView = "spark-radio-button-toggleView"
    /// The radio group title accessibility identifier.
    public static let radioGroupTitle = "spark-radio-button-title"
    /// The radio button text label accessibility identifier.
    public static let radioButtonTextLabel = "spark-radio-button-text-label"
    /// The text accessibility identifier.
    public static let text = "spark-radio-button-text"

    // MARK: - Methods

    /// The item accessibility identifier on radio group.
    public static func radioButtonItem<ID: CustomStringConvertible>(id: ID) -> String {
        return "\(self.view)-\(id)"
    }
}
