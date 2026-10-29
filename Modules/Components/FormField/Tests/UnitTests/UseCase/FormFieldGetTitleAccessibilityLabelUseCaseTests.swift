//
//  FormFieldGetTitleAccessibilityLabelUseCaseTests.swift
//  SparkComponentFormFieldTests
//
//  Created on 07/05/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import Testing
@testable import SparkComponentFormField

@Suite("FormField Get Title Accessibility Label UseCase Tests")
struct FormFieldGetTitleAccessibilityLabelUseCaseTests {

    // MARK: - Properties

    private let sut: FormFieldGetTitleAccessibilityLabelUseCase

    // MARK: - Setup

    init() {
        self.sut = FormFieldGetTitleAccessibilityLabelUseCase()
    }

    // MARK: - Tests - Returns Nil

    @Test("Execute when title and custom value are nil and is required is false should return nil")
    func executeWhenTitleAndCustomValueAreNilAndIsRequiredIsFalseShouldReturnNil() {
        // GIVEN
        let title: String? = nil
        let customValue: String? = nil
        let isRequired = false

        // WHEN
        let result = self.sut.execute(title: title, customValue: customValue, isRequired: isRequired)

        // THEN
        #expect(result == nil)
    }

    @Test("Execute when title and custom value are nil and is required is true should return nil")
    func executeWhenTitleAndCustomValueAreNilAndIsRequiredIsTrueShouldReturnNil() {
        // GIVEN
        let title: String? = nil
        let customValue: String? = nil
        let isRequired = true

        // WHEN
        let result = self.sut.execute(title: title, customValue: customValue, isRequired: isRequired)

        // THEN
        #expect(result == nil)
    }

    // MARK: - Tests - Returns Strings

    @Test("Execute when only title is provided and is required is false should return title")
    func executeWhenOnlyTitleIsProvidedAndIsRequiredIsFalseShouldReturnTitle() {
        // GIVEN
        let title = "Test Title"
        let customValue: String? = nil
        let isRequired = false

        // WHEN
        let result = self.sut.execute(title: title, customValue: customValue, isRequired: isRequired)

        // THEN
        #expect(result == title)
    }

    @Test("Execute when only title is provided and is required is true should return title with required suffix")
    func executeWhenOnlyTitleIsProvidedAndIsRequiredIsTrueShouldReturnTitleWithRequiredSuffix() {
        // GIVEN
        let title = "Test Title"
        let customValue: String? = nil
        let isRequired = true
        let expectedRequireString = ", " + String(localized: "accessibility_label_title_require", bundle: .current)

        // WHEN
        let result = self.sut.execute(title: title, customValue: customValue, isRequired: isRequired)

        // THEN
        #expect(result == title + expectedRequireString)
    }

    @Test("Execute when only custom value is provided and is required is false should return custom value")
    func executeWhenOnlyCustomValueIsProvidedAndIsRequiredIsFalseShouldReturnCustomValue() {
        // GIVEN
        let title: String? = nil
        let customValue = "Custom Value"
        let isRequired = false

        // WHEN
        let result = self.sut.execute(title: title, customValue: customValue, isRequired: isRequired)

        // THEN
        #expect(result == customValue)
    }

    @Test("Execute when only custom value is provided and is required is true should return custom value with required suffix")
    func executeWhenOnlyCustomValueIsProvidedAndIsRequiredIsTrueShouldReturnCustomValueWithRequiredSuffix() {
        // GIVEN
        let title: String? = nil
        let customValue = "Custom Value"
        let isRequired = true
        let expectedRequireString = ", " + String(localized: "accessibility_label_title_require", bundle: .current)

        // WHEN
        let result = self.sut.execute(title: title, customValue: customValue, isRequired: isRequired)

        // THEN
        #expect(result == customValue + expectedRequireString)
    }

    @Test("Execute when both title and custom value are provided and is required is false should return custom value")
    func executeWhenBothTitleAndCustomValueAreProvidedAndIsRequiredIsFalseShouldReturnCustomValue() {
        // GIVEN
        let title = "Test Title"
        let customValue = "Custom Value"
        let isRequired = false

        // WHEN
        let result = self.sut.execute(title: title, customValue: customValue, isRequired: isRequired)

        // THEN
        #expect(result == customValue)
    }

    @Test("Execute when both title and custom value are provided and is required is true should return custom value with required suffix")
    func executeWhenBothTitleAndCustomValueAreProvidedAndIsRequiredIsTrueShouldReturnCustomValueWithRequiredSuffix() {
        // GIVEN
        let title = "Test Title"
        let customValue = "Custom Value"
        let isRequired = true
        let expectedRequireString = ", " + String(localized: "accessibility_label_title_require", bundle: .current)

        // WHEN
        let result = self.sut.execute(title: title, customValue: customValue, isRequired: isRequired)

        // THEN
        #expect(result == customValue + expectedRequireString)
    }
}
