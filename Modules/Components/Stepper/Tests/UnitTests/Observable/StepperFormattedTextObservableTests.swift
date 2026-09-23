//
//  StepperFormattedTextObservableTests.swift
//  SparkComponentStepper
//
//  Created by robin.lemaire on 04/03/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentStepper

class StepperFormattedTextObservableTests: XCTestCase {

    // MARK: - Tests Without Format

    func testGetTextOnInitWithValue() {
        // GIVEN / WHEN
        let observable = StepperFormattedTextObservable(value: 5)

        // THEN
        XCTAssertEqual(observable.getText(), "5")
    }

    func testGetTextOnSetValue() {
        // GIVEN / WHEN
        let observable = StepperFormattedTextObservable(value: 5)
        observable.setValue(10)

        // THEN
        XCTAssertEqual(observable.getText(), "10")
    }

    // MARK: - Tests With Format

    func testGetTextOnInitWithValueAndFormat() {
        // GIVEN / WHEN
        let locale = Locale(identifier: "fr_FR")
        let observable = StepperFormattedTextObservable(value: 5, format: .percent.locale(locale))

        // THEN
        XCTAssertEqual(observable.getText(), "5 %")
    }

    func testGetTextOnSetValueWithFormat() {
        // GIVEN / WHEN
        let locale = Locale(identifier: "en_US")
        let observable = StepperFormattedTextObservable(value: 5, format: .percent.locale(locale))
        observable.setValue(10)

        // THEN
        XCTAssertEqual(observable.getText(), "10%")
    }
}
