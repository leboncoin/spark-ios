//
//  ControlStateImage.swift
//  SparkCommon
//
//  Created by robin.lemaire on 24/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "Only used on deprecated button. Remove ASAP (13/03/2026")
@_spi(SI_SPI) public final class ControlStateImage: ObservableObject {

    // MARK: - Public Published Properties

    @Published public var image: Image?

    // MARK: - Private Properties

    private let imageStates = ControlPropertyStates<Image>()

    // MARK: - Initialization

    public init() { }

    // MARK: - Setter

    /// Set the image for a state.
    /// - parameter image: the new image
    /// - parameter state: the state of the image
    /// - parameter status: the status of the parent control
    public func setImage(
        _ image: Image?,
        for state: ControlState,
        on status: ControlStatus
    ) {
        self.imageStates.setValue(image, for: state)
        self.updateContent(from: status)
    }

    // MARK: - Update UI

    /// Update the label (image or attributed) for a parent control state.
    /// - parameter status: the status of the parent control
    public func updateContent(from status: ControlStatus) {
        self.image = self.imageStates.value(for: status)
    }
}
