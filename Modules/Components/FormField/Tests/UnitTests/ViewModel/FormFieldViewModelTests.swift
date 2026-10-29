//
//  FormFieldViewModelTests.swift
//  SparkComponentFormFieldUnitTests
//
//  Created by alican.aycil on 26.03.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import SwiftUI
import Testing
@testable import SparkComponentFormField
@_spi(SI_SPI) import SparkComponentFormFieldTesting
@_spi(SI_SPI) import SparkCommonTesting
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkCommon

@MainActor
@Suite("FormField ViewModel Tests")
final class FormFieldViewModelTests {

    var theme: ThemeGeneratedMock!
    var checkedImage = IconographyTests.shared.checkmark

    // MARK: - Setup

    init() {

        self.theme = ThemeGeneratedMock.mocked()
    }

    // MARK: - Tests

    @Test("Init")
    func initialization() throws {
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
        #expect(viewModel.theme != nil, "No theme set")
        #expect(viewModel.feedbackState != nil, "No feedback state set")
        #expect(viewModel.isRequired != nil, "No title required set")
        #expect(viewModel.title == "Title")
        #expect(viewModel.formattedTitle?.leftValue.string == expectedFormattedTitle)
        #expect(viewModel.titleAccessibilityLabel == titleAccessibilityLabel)
        #expect(viewModel.helper == "Helper")
        #expect(viewModel.spacing == self.theme.layout.spacing.small)

        #expect(viewModel.clearButtonColor as? ColorTokenGeneratedMock === clearButtonColorMock)
        #expect(viewModel.clearButtonFont as? TypographyFontTokenGeneratedMock === clearButtonFontMock)
        #expect(viewModel.helperColor as? ColorTokenGeneratedMock === helperColorMock)
        #expect(viewModel.helperFont as? TypographyFontTokenGeneratedMock === helperFontMock)
        #expect(viewModel.secondaryHelperColor as? ColorTokenGeneratedMock === secondaryHelperColorMock)
        #expect(viewModel.secondaryHelperFont as? TypographyFontTokenGeneratedMock === secondaryHelperFontMock)
    }

    @Test("Title")
    func title() {
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
        #expect(viewModel.title == newTitle)
        #expect(viewModel.formattedTitle?.leftValue.string == expectedFormattedTitle)
        #expect(viewModel.titleAccessibilityLabel == titleAccessibilityLabel)

        // **
        #expect(
            getFormattedTitleUseCaseMocked.executeWithFrameworkTypeAndTitleAndIsRequiredAndColorsAndFontsCallsCount == 2,
            "Wrong number of call on getFormattedTitleUseCase"
        )

        let formattedTitleArgs = getFormattedTitleUseCaseMocked.executeWithFrameworkTypeAndTitleAndIsRequiredAndColorsAndFontsReceivedArguments
        #expect(
            formattedTitleArgs?.title == newTitle,
            "Wrong title parameter on getFormattedTitleUseCase"
        )
        #expect(
            formattedTitleArgs?.isRequired == false,
            "Wrong isRequired parameter on getFormattedTitleUseCase"
        )
        // **

        // **
        #expect(
            getTitleAccessibilityLabelUseCaseMocked.executeWithTitleAndCustomValueAndIsRequiredCallsCount == 2,
            "Wrong number of call on getTitleAccessibilityLabelUseCase"
        )

        let titleA11yLabelArgs = getTitleAccessibilityLabelUseCaseMocked.executeWithTitleAndCustomValueAndIsRequiredReceivedArguments
        #expect(
            titleA11yLabelArgs?.title == newTitle,
            "Wrong title parameter on getTitleAccessibilityLabelUseCase"
        )
        #expect(
            titleA11yLabelArgs?.customValue == nil,
            "Wrong customValue parameter on getTitleAccessibilityLabelUseCase"
        )
        #expect(
            titleA11yLabelArgs?.isRequired == false,
            "Wrong isRequired parameter on getTitleAccessibilityLabelUseCase"
        )
        // **
    }

    @Test("Is required")
    func isRequired() {
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
        #expect(viewModel.title == "Title")
        #expect(viewModel.formattedTitle?.leftValue.string == expectedFormattedTitle)
        #expect(viewModel.titleAccessibilityLabel == titleAccessibilityLabel)

        // **
        #expect(
            getFormattedTitleUseCaseMocked.executeWithFrameworkTypeAndTitleAndIsRequiredAndColorsAndFontsCallsCount == 2,
            "Wrong number of call on getFormattedTitleUseCase"
        )

        let formattedTitleArgs = getFormattedTitleUseCaseMocked.executeWithFrameworkTypeAndTitleAndIsRequiredAndColorsAndFontsReceivedArguments
        #expect(
            formattedTitleArgs?.title == "Title",
            "Wrong title parameter on getFormattedTitleUseCase"
        )
        #expect(
            formattedTitleArgs?.isRequired == true,
            "Wrong isRequired parameter on getFormattedTitleUseCase"
        )
        // **

        // **
        #expect(
            getTitleAccessibilityLabelUseCaseMocked.executeWithTitleAndCustomValueAndIsRequiredCallsCount == 2,
            "Wrong number of call on getTitleAccessibilityLabelUseCase"
        )

        let titleA11yLabelArgs = getTitleAccessibilityLabelUseCaseMocked.executeWithTitleAndCustomValueAndIsRequiredReceivedArguments
        #expect(
            titleA11yLabelArgs?.title == "Title",
            "Wrong title parameter on getTitleAccessibilityLabelUseCase"
        )
        #expect(
            titleA11yLabelArgs?.customValue == nil,
            "Wrong customValue parameter on getTitleAccessibilityLabelUseCase"
        )
        #expect(
            titleA11yLabelArgs?.isRequired == true,
            "Wrong isRequired parameter on getTitleAccessibilityLabelUseCase"
        )
        // **
    }

    @Test("Set counter with text")
    func setCounterWithText() {
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
        #expect(viewModel.secondaryHelper == "4/100")
    }

    @Test("Set counter without text")
    func setCounterWithoutText() {
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
        #expect(viewModel.secondaryHelper == "0/100")
    }

    @Test("Set counter with text length")
    func setCounterWithTextLength() {
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
        #expect(viewModel.secondaryHelper == "4/100")
    }

    @Test("Set counter without text length")
    func setCounterWithoutTextLength() {
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
        #expect(viewModel.secondaryHelper == "0/100")
    }

    @Test("Set counter without limit")
    func setCounterWithoutLimit() {
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
        #expect(viewModel.secondaryHelper == nil)
    }

    @Test("Set feedback state")
    func setFeedbackState() {
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
        #expect(viewModel.feedbackState == .error)
    }
}
