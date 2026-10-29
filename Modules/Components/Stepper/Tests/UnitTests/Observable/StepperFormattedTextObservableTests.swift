//
//  StepperFormattedTextObservableTests.swift
//  SparkComponentStepper
//
//  Created by robin.lemaire on 04/03/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import Testing
@testable import SparkComponentStepper

@Suite("Stepper Formatted Text Observable Tests")
struct StepperFormattedTextObservableTests {

    // MARK: - Tests Without Format

    @Test("Get text on init with value")
    func getTextOnInitWithValue() {
        // GIVEN / WHEN
        let observable = StepperFormattedTextObservable(value: 5)

        // THEN
        #expect(observable.getText() == "5")
    }

    @Test("Get text on set value")
    func getTextOnSetValue() {
        // GIVEN / WHEN
        let observable = StepperFormattedTextObservable(value: 5)
        observable.setValue(10)

        // THEN
        #expect(observable.getText() == "10")
    }

    // MARK: - Tests With Format

    @Test("Get text on init with value and format")
    func getTextOnInitWithValueAndFormat() {
        // GIVEN / WHEN
        let locale = Locale(identifier: "fr_FR")
        let observable = StepperFormattedTextObservable(value: 5, format: .percent.locale(locale))

        // THEN
        #expect(observable.getText() == "5 %")
    }

    @Test("Get text on set value with format")
    func getTextOnSetValueWithFormat() {
        // GIVEN / WHEN
        let locale = Locale(identifier: "en_US")
        let observable = StepperFormattedTextObservable(value: 5, format: .percent.locale(locale))
        observable.setValue(10)

        // THEN
        #expect(observable.getText() == "10%")
    }
}
