//
//  Accessibility.swift
//  SparkCommon
//
//  Created by robin.lemaire on 16/12/2024.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI

/// Struct using to manage the accessibility properties on SwiftUI.

@available(*, deprecated, message: "Remove ASAP. Should not be used anymore.")
@_spi(SI_SPI) public struct Accessibility {

    // MARK: - Properties

    public var label: String?
    public var value: String?
    public var inputLabels: [String]?
    public var hint: String?
    public var hidden: Bool?
    public var action: Action?

    // MARK: - Initialization

    /// Init the accessibility struct.
    /// - Parameters:
    ///   - label: the accessibility label. *Optional*. Nil by default. If the value is nil, the accessibilityLabel will not be setted.
    ///   - value: the accessibility value. *Optional*. Nil by default. If the value is nil, the accessibilityValue will not be setted.
    ///   - inputLabels: the accessibility input labels. *Optional*. Nil by default. If the value is nil, the accessibilityInputLabels will not be setted.
    ///   - hint: the accessibility hint. *Optional*. Nil by default. If the value is nil, the accessibilityHint will not be setted.
    ///   - hidden: the accessibility hidden. *Optional*. Nil by default. If the value is nil, the accessibilityHidden will not be setted.
    ///   - action: the accessibility action. *Optional*. Nil by default. If the value is nil, the accessibilityAction will not be setted.
    public init(
        label: String? = nil,
        value: String? = nil,
        inputLabels: [String]? = nil,
        hint: String? = nil,
        hidden: Bool? = nil,
        action: Accessibility.Action? = nil
    ) {
        self.label = label
        self.value = value
        self.inputLabels = inputLabels
        self.hint = hint
        self.hidden = hidden
        self.action = action
    }

    // MARK: - Sub Struct

    public struct Action {

        // MARK: - Properties

        internal let name: String
        internal let handler: () -> Void

        // MARK: - Initialization

        /// Init the accessibility action struct.
        /// - Parameters:
        ///   - name: the name of the accessibility action
        ///   - handler: the handler of the accessibility action.
        public init(
            name: String,
            handler: @escaping () -> Void
        ) {
            self.name = name
            self.handler = handler
        }
    }
}
