//
//  FormFieldViewModelTests.swift
//  SparkComponentFormFieldUnitTests
//
//  Created by alican.aycil on 26.03.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import SwiftUI
import XCTest
@testable import SparkComponentFormField
@_spi(SI_SPI) import SparkComponentFormFieldTesting
@_spi(SI_SPI) import SparkCommonTesting
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkCommon

final class FormFieldViewModelTests: XCTestCase {

    var theme: ThemeGeneratedMock!
    var checkedImage = IconographyTests.shared.checkmark

    // MARK: - Setup

    override func setUpWithError() throws {
        try super.setUpWithError()

        self.theme = ThemeGeneratedMock.mocked()
    }

    // MARK: - Tests

    func test_init() throws {
        // GIVEN
        let titleColorMock = ColorTokenGeneratedMock()
        let clearButtonColorMock = ColorTokenGeneratedMock()
        let requireColorMock = ColorTokenGeneratedMock()
        let helperColorMock = ColorTokenGeneratedMock()
        let secondaryHelperColorMock = ColorTokenGeneratedMock()

        let getColorsUseCaseMocked = FormFieldGetColorsUseCaseableGeneratedMock()
        getColorsUseCaseMocked.executeWithThemeAndStateReturnValue = .init(
            title: titleColorMock,
            clearButton: clearButtonColorMock,
            require: requireColorMock,
            helper: helperColorMock,
            secondaryHelper: secondaryHelperColorMock
        )

        let titleFontMock = TypographyFontTokenGeneratedMock()
        let clearButtonFontMock = TypographyFontTokenGeneratedMock()
        let requireFontMock = TypographyFontTokenGeneratedMock()
        let helperFontMock = TypographyFontTokenGeneratedMock()
        let secondaryHelperFontMock = TypographyFontTokenGeneratedMock()

        let getFontsUseCaseMocked = FormFieldGetFontsUseCaseableGeneratedMock()
        getFontsUseCaseMocked.executeWithThemeReturnValue = .init(
            title: titleFontMock,
            clearButton: clearButtonFontMock,
            require: requireFontMock,
            helper: helperFontMock,
            secondaryHelper: secondaryHelperFontMock
        )

        let expectedFormattedTitle = "hello"
        let getFormattedTitleUseCaseMocked = FormFieldGetFormattedTitleUseCaseableGeneratedMock()
        getFormattedTitleUseCaseMocked.executeWithFrameworkTypeAndTitleAndIsRequiredAndColorsAndFontsReturnValue = .left(.init(string: expectedFormattedTitle))

        let titleAccessibilityLabel = "Accessibility label"
        let getTitleAccessibilityLabelUseCaseMocked = FormFieldGetTitleAccessibilityLabelUseCaseableGeneratedMock()
        getTitleAccessibilityLabelUseCaseMocked.executeWithTitleAndCustomValueAndIsRequiredReturnValue = titleAccessibilityLabel

        // WHEN
        let viewModel = FormFieldViewModel(
            frameworkType: .uiKit,
            theme: self.theme,
            feedbackState: .default,
            title: "Title",
            helper: "Helper",
            isRequired: true,
            getColorsUseCase: getColorsUseCaseMocked,
            getFontsUseCase: getFontsUseCaseMocked,
            getFormattedTitleUseCase: getFormattedTitleUseCaseMocked,
            getTitleAccessibilityLabelUseCase: getTitleAccessibilityLabelUseCaseMocked
        )

        // THEN
        XCTAssertNotNil(viewModel.theme, "No theme set")
        XCTAssertNotNil(viewModel.feedbackState, "No feedback state set")
        XCTAssertNotNil(viewModel.isRequired, "No title required set")
        XCTAssertEqual(viewModel.title, "Title")
        XCTAssertEqual(viewModel.formattedTitle?.leftValue.string, expectedFormattedTitle)
        XCTAssertEqual(viewModel.titleAccessibilityLabel, titleAccessibilityLabel)
        XCTAssertEqual(viewModel.helper, "Helper")
        XCTAssertEqual(viewModel.spacing, self.theme.layout.spacing.small)

        XCTAssertIdentical(viewModel.clearButtonColor as? ColorTokenGeneratedMock, clearButtonColorMock)
        XCTAssertIdentical(viewModel.clearButtonFont as? TypographyFontTokenGeneratedMock, clearButtonFontMock)
        XCTAssertIdentical(viewModel.helperColor as? ColorTokenGeneratedMock, helperColorMock)
        XCTAssertIdentical(viewModel.helperFont as? TypographyFontTokenGeneratedMock, helperFontMock)
        XCTAssertIdentical(viewModel.secondaryHelperColor as? ColorTokenGeneratedMock, secondaryHelperColorMock)
        XCTAssertIdentical(viewModel.secondaryHelperFont as? TypographyFontTokenGeneratedMock, secondaryHelperFontMock)
    }

    func test_title() {
        // GIVEN
        let newTitle = "Hello again"

        let expectedFormattedTitle = "hello"
        let getFormattedTitleUseCaseMocked = FormFieldGetFormattedTitleUseCaseableGeneratedMock()
        getFormattedTitleUseCaseMocked.executeWithFrameworkTypeAndTitleAndIsRequiredAndColorsAndFontsReturnValue = .left(.init(string: expectedFormattedTitle))

        let titleAccessibilityLabel = "Accessibility label"
        let getTitleAccessibilityLabelUseCaseMocked = FormFieldGetTitleAccessibilityLabelUseCaseableGeneratedMock()
        getTitleAccessibilityLabelUseCaseMocked.executeWithTitleAndCustomValueAndIsRequiredReturnValue = titleAccessibilityLabel

        let viewModel = FormFieldViewModel(
            frameworkType: .uiKit,
            theme: self.theme,
            feedbackState: .default,
            title: "Title",
            helper: "Helper",
            isRequired: false,
            getFormattedTitleUseCase: getFormattedTitleUseCaseMocked,
            getTitleAccessibilityLabelUseCase: getTitleAccessibilityLabelUseCaseMocked
        )

        // WHEN
        viewModel.title = newTitle

        // THEN
        XCTAssertEqual(viewModel.title, newTitle)
        XCTAssertEqual(viewModel.formattedTitle?.leftValue.string, expectedFormattedTitle)
        XCTAssertEqual(viewModel.titleAccessibilityLabel, titleAccessibilityLabel)

        // **
        XCTAssertEqual(
            getFormattedTitleUseCaseMocked.executeWithFrameworkTypeAndTitleAndIsRequiredAndColorsAndFontsCallsCount,
            2,
            "Wrong number of call on getFormattedTitleUseCase"
        )

        let formattedTitleArgs = getFormattedTitleUseCaseMocked.executeWithFrameworkTypeAndTitleAndIsRequiredAndColorsAndFontsReceivedArguments
        XCTAssertEqual(
            formattedTitleArgs?.title,
            newTitle,
            "Wrong title parameter on getFormattedTitleUseCase"
        )
        XCTAssertEqual(
            formattedTitleArgs?.isRequired,
            false,
            "Wrong isRequired parameter on getFormattedTitleUseCase"
        )
        // **

        // **
        XCTAssertEqual(
            getTitleAccessibilityLabelUseCaseMocked.executeWithTitleAndCustomValueAndIsRequiredCallsCount,
            2,
            "Wrong number of call on getTitleAccessibilityLabelUseCase"
        )

        let titleA11yLabelArgs = getTitleAccessibilityLabelUseCaseMocked.executeWithTitleAndCustomValueAndIsRequiredReceivedArguments
        XCTAssertEqual(
            titleA11yLabelArgs?.title,
            newTitle,
            "Wrong title parameter on getTitleAccessibilityLabelUseCase"
        )
        XCTAssertNil(
            titleA11yLabelArgs?.customValue,
            "Wrong customValue parameter on getTitleAccessibilityLabelUseCase"
        )
        XCTAssertEqual(
            titleA11yLabelArgs?.isRequired,
            false,
            "Wrong isRequired parameter on getTitleAccessibilityLabelUseCase"
        )
        // **
    }

    func test_isRequired() {
        // GIVEN
        let expectedFormattedTitle = "hello"
        let getFormattedTitleUseCaseMocked = FormFieldGetFormattedTitleUseCaseableGeneratedMock()
        getFormattedTitleUseCaseMocked.executeWithFrameworkTypeAndTitleAndIsRequiredAndColorsAndFontsReturnValue = .left(.init(string: expectedFormattedTitle))

        let titleAccessibilityLabel = "Accessibility label"
        let getTitleAccessibilityLabelUseCaseMocked = FormFieldGetTitleAccessibilityLabelUseCaseableGeneratedMock()
        getTitleAccessibilityLabelUseCaseMocked.executeWithTitleAndCustomValueAndIsRequiredReturnValue = titleAccessibilityLabel

        let viewModel = FormFieldViewModel(
            frameworkType: .uiKit,
            theme: self.theme,
            feedbackState: .default,
            title: "Title",
            helper: "Helper",
            isRequired: false,
            getFormattedTitleUseCase: getFormattedTitleUseCaseMocked,
            getTitleAccessibilityLabelUseCase: getTitleAccessibilityLabelUseCaseMocked
        )

        // WHEN
        viewModel.isRequired = true

        // THEN
        XCTAssertEqual(viewModel.title, "Title")
        XCTAssertEqual(viewModel.formattedTitle?.leftValue.string, expectedFormattedTitle)
        XCTAssertEqual(viewModel.titleAccessibilityLabel, titleAccessibilityLabel)

        // **
        XCTAssertEqual(
            getFormattedTitleUseCaseMocked.executeWithFrameworkTypeAndTitleAndIsRequiredAndColorsAndFontsCallsCount,
            2,
            "Wrong number of call on getFormattedTitleUseCase"
        )

        let formattedTitleArgs = getFormattedTitleUseCaseMocked.executeWithFrameworkTypeAndTitleAndIsRequiredAndColorsAndFontsReceivedArguments
        XCTAssertEqual(
            formattedTitleArgs?.title,
            "Title",
            "Wrong title parameter on getFormattedTitleUseCase"
        )
        XCTAssertEqual(
            formattedTitleArgs?.isRequired,
            true,
            "Wrong isRequired parameter on getFormattedTitleUseCase"
        )
        // **

        // **
        XCTAssertEqual(
            getTitleAccessibilityLabelUseCaseMocked.executeWithTitleAndCustomValueAndIsRequiredCallsCount,
            2,
            "Wrong number of call on getTitleAccessibilityLabelUseCase"
        )

        let titleA11yLabelArgs = getTitleAccessibilityLabelUseCaseMocked.executeWithTitleAndCustomValueAndIsRequiredReceivedArguments
        XCTAssertEqual(
            titleA11yLabelArgs?.title,
            "Title",
            "Wrong title parameter on getTitleAccessibilityLabelUseCase"
        )
        XCTAssertNil(
            titleA11yLabelArgs?.customValue,
            "Wrong customValue parameter on getTitleAccessibilityLabelUseCase"
        )
        XCTAssertEqual(
            titleA11yLabelArgs?.isRequired,
            true,
            "Wrong isRequired parameter on getTitleAccessibilityLabelUseCase"
        )
        // **
    }

    func test_setCounter_with_text() {
        // GIVEN
        let viewModel = FormFieldViewModel(
            frameworkType: .uiKit,
            theme: self.theme,
            feedbackState: .default,
            title: "Title",
            helper: "Helper",
            isRequired: true
        )

        // WHEN
        viewModel.setCounter(text: "text", limit: 100)

        // THEN
        XCTAssertEqual(viewModel.secondaryHelper, "4/100")
    }

    func test_setCounter_without_text() {
        // GIVEN
        let viewModel = FormFieldViewModel(
            frameworkType: .uiKit,
            theme: self.theme,
            feedbackState: .default,
            title: "Title",
            helper: "Helper",
            isRequired: true
        )

        // WHEN
        viewModel.setCounter(text: nil, limit: 100)

        // THEN
        XCTAssertEqual(viewModel.secondaryHelper, "0/100")
    }

    func test_setCounter_with_textLength() {
        // GIVEN
        let viewModel = FormFieldViewModel(
            frameworkType: .uiKit,
            theme: self.theme,
            feedbackState: .default,
            title: "Title",
            helper: "Helper",
            isRequired: true
        )

        // WHEN
        viewModel.setCounter(textLength: 4, limit: 100)

        // THEN
        XCTAssertEqual(viewModel.secondaryHelper, "4/100")
    }

    func test_setCounter_without_textLength() {
        // GIVEN
        let viewModel = FormFieldViewModel(
            frameworkType: .uiKit,
            theme: self.theme,
            feedbackState: .default,
            title: "Title",
            helper: "Helper",
            isRequired: true
        )

        // WHEN
        viewModel.setCounter(textLength: nil, limit: 100)

        // THEN
        XCTAssertEqual(viewModel.secondaryHelper, "0/100")
    }

    func test_setCounter_without_limit() {
        // GIVEN
        let viewModel = FormFieldViewModel(
            frameworkType: .uiKit,
            theme: self.theme,
            feedbackState: .default,
            title: "Title",
            helper: "Helper",
            isRequired: true
        )

        // WHEN
        viewModel.setCounter(text: "azazd", limit: nil)

        // THEN
        XCTAssertNil(viewModel.secondaryHelper)
    }

    func test_set_feedback_state() {
        // GIVEN
        let viewModel = FormFieldViewModel(
            frameworkType: .uiKit,
            theme: self.theme,
            feedbackState: .default,
            title: "Title",
            helper: "Helper",
            isRequired: false
        )

        // WHEN
        viewModel.feedbackState = .error

        // THEN
        XCTAssertEqual(viewModel.feedbackState, .error)
    }
}
