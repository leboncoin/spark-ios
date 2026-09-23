//
//  ControlPropertyState.swift
//  SparkCommon
//
//  Created by robin.lemaire on 25/10/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

/// Contains the dynamic property for a ControlState.
@available(*, deprecated, message: "Only used on deprecated button. Remove ASAP (13/03/2026")
@_spi(SI_SPI) public final class ControlPropertyState<T: Equatable> {

    // MARK: - Properties

    public var value: T?
    private let state: ControlState

    // MARK: - Initialization

    /// Init the object with a state. The value is nil by default.
    public init(for state: ControlState) {
        self.state = state
    }
}
