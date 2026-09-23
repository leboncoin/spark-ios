//
//  SelectionControlsGroupUIItem.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 22/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

/// A simple struct for defining radio group item using in ``SparkUIRadioGroup`` or checkbox group item using in ``SparkUICheckboxGroup``.
public struct SelectionControlsGroupUIItem<ID>: Identifiable where ID: SelectionControlsGroupID {

    // MARK: - Properties

    /// The identifier of the checkbox.
    public let id: ID

    /// The text of the checkbox.
    public let text: String?

    /// The attributed text of the checkbox.
    public let attributedText: NSAttributedString?

    /// The current control state of the checkbox.
    public var isEnabled: Bool

    // MARK: - Initialization

    /// Creates a checkbox group item from a localized string key.
    ///
    /// - Parameters:
    ///  - id: A unique ID bound to a generic type which has the constraints that it need be ``Equatable`` & ``Hashable``
    ///  - text: The text for the checkbox, that describes the purpose of the checkbox.
    ///  - isEnabled: The current control state of the checkbox. Default is **true**.
    public init(
        id: ID,
        text: String,
        isEnabled: Bool = true
    ) {
        self.id = id
        self.text = text
        self.attributedText = nil
        self.isEnabled = isEnabled
    }

    /// Creates a checkbox group item from a string.
    ///
    /// - Parameters:
    ///  - id: A unique ID bound to a generic type which has the constraints that it need be ``Equatable`` & ``Hashable``
    ///  - attributedText: The attributed text for the checkbox, that describes the purpose of the checkbox.
    ///  - isEnabled: The current control state of the checkbox. Default is **true**.
    public init(
        id: ID,
        attributedText: NSAttributedString,
        isEnabled: Bool = true
    ) {
        self.id = id
        self.text = nil
        self.attributedText = attributedText
        self.isEnabled = isEnabled
    }
}
