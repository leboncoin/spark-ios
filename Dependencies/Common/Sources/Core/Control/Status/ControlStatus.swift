//
//  ControlStatus.swift
//  SparkCommon
//
//  Created by robin.lemaire on 25/10/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

/// The current status of the control: highlighted or not, disabled or not and selected or not.
@available(*, deprecated, message: "Only used on deprecated button. Remove ASAP (13/03/2026")
@_spi(SI_SPI) public final class ControlStatus: Equatable {

    // MARK: - Properties

    /// A Boolean value indicating whether the control draws a highlight.
    public var isHighlighted: Bool
    /// A Boolean value indicating whether the control is in the enabled state.
    public var isEnabled: Bool
    /// A Boolean value indicating whether the control is in the selected state.
    public var isSelected: Bool

    // MARK: - Initialization

    public init(
        isHighlighted: Bool = false,
        isEnabled: Bool = true,
        isSelected: Bool = false
    ) {
        self.isHighlighted = isHighlighted
        self.isEnabled = isEnabled
        self.isSelected = isSelected
    }

    // MARK: - Equatable

    public static func == (lhs: ControlStatus, rhs: ControlStatus) -> Bool {
        return lhs.isHighlighted == rhs.isHighlighted &&
        lhs.isEnabled == rhs.isEnabled &&
        lhs.isSelected == rhs.isSelected
    }
}
