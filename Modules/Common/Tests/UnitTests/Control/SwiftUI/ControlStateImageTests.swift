//
//  ControlStateImageTests.swift
//  SparkCoreUnitTests
//
//  Created by robin.lemaire on 24/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI

@_spi(SI_SPI) @testable import SparkCommon

@MainActor
@Suite("Control State Image Tests")
struct ControlStateImageTests {

    // MARK: - Tests

    @Test("Default image")
    func defaultImage() {
        // GIVEN / WHEN
        let controlStateImage = ControlStateImage()

        // THEN
        #expect(controlStateImage.image == nil)
    }

    @Test("Set image")
    func setImage() {
        // GIVEN
        let givenImage = Image("arrow")

        let controlStateImage = ControlStateImage()

        let statesMock = ControlPropertyStates<Image>()
        statesMock.setValue(
            givenImage,
            for: .normal
        )

        // WHEN
        controlStateImage.setImage(
            givenImage,
            for: .normal,
            on: .init()
        )

        // THEN
        #expect(controlStateImage.image == statesMock.value(for: .normal))
    }

    @Test("Update content")
    func updateContent() {
        // GIVEN
        let givenDisabledImage = Image("switchOff")

        let control = ControlStatus(isEnabled: false)

        let controlStateImage = ControlStateImage()

        let statesMock = ControlPropertyStates<Image>()

        controlStateImage.setImage(
            givenDisabledImage,
            for: .disabled,
            on: .init()
        )
        statesMock.setValue(
            givenDisabledImage,
            for: .disabled
        )

        // WHEN
        controlStateImage.updateContent(from: control)

        // THEN
        #expect(controlStateImage.image == statesMock.value(for: .disabled))
    }
}
