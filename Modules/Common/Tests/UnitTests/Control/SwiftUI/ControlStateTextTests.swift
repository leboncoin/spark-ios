//
//  ControlStateTextTests.swift
//  SparkCoreUnitTests
//
//  Created by robin.lemaire on 24/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI

@_spi(SI_SPI) @testable import SparkCommon

@MainActor
@Suite("Control State Text Tests")
struct ControlStateTextTests {

    // MARK: - Tests

    @Test("Default values")
    func defaultValues() {
        // GIVEN / WHEN
        let controlStateText = ControlStateText()

        // THEN
        #expect(controlStateText.text == nil, "Wrong text value")
        #expect(controlStateText.attributedText == nil, "Wrong attributedText value")
    }

    @Test("Set text")
    func setText() {
        // GIVEN
        let givenText = "My Text"

        let controlStateText = ControlStateText()

        let statesMock = ControlPropertyStates<String>()
        statesMock.setValue(
            givenText,
            for: .normal
        )

        var control = ControlStatus()

        // WHEN
        controlStateText.setText(
            givenText,
            for: .normal,
            on: control
        )

        // THEN
        #expect(controlStateText.text == statesMock.value(for: .normal), "Wrong text value")
        #expect(controlStateText.attributedText == nil, "Wrong attributedText value")

        // WHEN

        // Check when a text is nil for an another state,
        // The text text for the normal state should be returned

        control.isHighlighted = true

        controlStateText.setText(
            nil,
            for: .highlighted,
            on: control
        )

        // THEN
        #expect(controlStateText.text == statesMock.value(for: .normal), "Wrong text value when control isPressed")
    }

    @Test("Set attributed text")
    func setAttributedText() {
        // GIVEN
        let givenAttributedText = AttributedString("My AT Text")

        let controlStateText = ControlStateText()

        let statesMock = ControlPropertyStates<AttributedString>()
        statesMock.setValue(
            givenAttributedText,
            for: .normal
        )

        var control = ControlStatus()

        // WHEN
        controlStateText.setAttributedText(
            givenAttributedText,
            for: .normal,
            on: control
        )

        // THEN
        #expect(controlStateText.text == nil, "Wrong text value")
        #expect(controlStateText.attributedText == statesMock.value(for: .normal), "Wrong attributedText value")

        // WHEN

        // Check when a attributedText is nil for an another state,
        // The attributedText value for the normal state should be returned

        control.isHighlighted = true

        controlStateText.setAttributedText(
            nil,
            for: .highlighted,
            on: control
        )

        // THEN
        #expect(controlStateText.attributedText == statesMock.value(for: .normal), "Wrong attributedText value when control isPressed")
    }

    @Test("Update content")
    func updateContent() {
        // GIVEN
        let givenDisabledText = "My Disabled Text"

        let control = ControlStatus(isEnabled: false)

        let controlStateText = ControlStateText()

        let statesMock = ControlPropertyStates<String>()

        controlStateText.setText(
            givenDisabledText,
            for: .disabled,
            on: .init()
        )
        statesMock.setValue(
            givenDisabledText,
            for: .disabled
        )

        // WHEN
        controlStateText.updateContent(from: control)

        // THEN
        #expect(controlStateText.text == statesMock.value(for: .disabled))
    }
}
