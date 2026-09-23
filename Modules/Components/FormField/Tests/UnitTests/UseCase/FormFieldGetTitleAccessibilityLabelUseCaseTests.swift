//
//  FormFieldGetTitleAccessibilityLabelUseCaseTests.swift
//  SparkComponentFormFieldTests
//
//  Created on 07/05/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentFormField

final class FormFieldGetTitleAccessibilityLabelUseCaseTests: XCTestCase {

    // MARK: - Properties

    private var sut: FormFieldGetTitleAccessibilityLabelUseCase!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.sut = FormFieldGetTitleAccessibilityLabelUseCase()
    }

    override func tearDown() {
        self.sut = nil

        super.tearDown()
    }

    // MARK: - Tests - Returns Nil

    func test_execute_whenTitleAndCustomValueAreNil_andIsRequiredIsFalse_shouldReturnNil() {
        // GIVEN
        let title: String? = nil
        let customValue: String? = nil
        let isRequired = false

        // WHEN
        let result = self.sut.execute(title: title, customValue: customValue, isRequired: isRequired)

        // THEN
        XCTAssertNil(result)
    }

    func test_execute_whenTitleAndCustomValueAreNil_andIsRequiredIsTrue_shouldReturnNil() {
        // GIVEN
        let title: String? = nil
        let customValue: String? = nil
        let isRequired = true

        // WHEN
        let result = self.sut.execute(title: title, customValue: customValue, isRequired: isRequired)

        // THEN
        XCTAssertNil(result)
    }

    // MARK: - Tests - Returns Strings

    func test_execute_whenOnlyTitleIsProvided_andIsRequiredIsFalse_shouldReturnTitle() {
        // GIVEN
        let title = "Test Title"
        let customValue: String? = nil
        let isRequired = false

        // WHEN
        let result = self.sut.execute(title: title, customValue: customValue, isRequired: isRequired)

        // THEN
        XCTAssertEqual(result, title)
    }

    func test_execute_whenOnlyTitleIsProvided_andIsRequiredIsTrue_shouldReturnTitleWithRequiredSuffix() {
        // GIVEN
        let title = "Test Title"
        let customValue: String? = nil
        let isRequired = true
        let expectedRequireString = ", " + String(localized: "accessibility_label_title_require", bundle: .current)

        // WHEN
        let result = self.sut.execute(title: title, customValue: customValue, isRequired: isRequired)

        // THEN
        XCTAssertEqual(result, title + expectedRequireString)
    }

    func test_execute_whenOnlyCustomValueIsProvided_andIsRequiredIsFalse_shouldReturnCustomValue() {
        // GIVEN
        let title: String? = nil
        let customValue = "Custom Value"
        let isRequired = false

        // WHEN
        let result = self.sut.execute(title: title, customValue: customValue, isRequired: isRequired)

        // THEN
        XCTAssertEqual(result, customValue)
    }

    func test_execute_whenOnlyCustomValueIsProvided_andIsRequiredIsTrue_shouldReturnCustomValueWithRequiredSuffix() {
        // GIVEN
        let title: String? = nil
        let customValue = "Custom Value"
        let isRequired = true
        let expectedRequireString = ", " + String(localized: "accessibility_label_title_require", bundle: .current)

        // WHEN
        let result = self.sut.execute(title: title, customValue: customValue, isRequired: isRequired)

        // THEN
        XCTAssertEqual(result, customValue + expectedRequireString)
    }

    func test_execute_whenBothTitleAndCustomValueAreProvided_andIsRequiredIsFalse_shouldReturnCustomValue() {
        // GIVEN
        let title = "Test Title"
        let customValue = "Custom Value"
        let isRequired = false

        // WHEN
        let result = self.sut.execute(title: title, customValue: customValue, isRequired: isRequired)

        // THEN
        XCTAssertEqual(result, customValue)
    }

    func test_execute_whenBothTitleAndCustomValueAreProvided_andIsRequiredIsTrue_shouldReturnCustomValueWithRequiredSuffix() {
        // GIVEN
        let title = "Test Title"
        let customValue = "Custom Value"
        let isRequired = true
        let expectedRequireString = ", " + String(localized: "accessibility_label_title_require", bundle: .current)

        // WHEN
        let result = self.sut.execute(title: title, customValue: customValue, isRequired: isRequired)

        // THEN
        XCTAssertEqual(result, customValue + expectedRequireString)
    }
}
