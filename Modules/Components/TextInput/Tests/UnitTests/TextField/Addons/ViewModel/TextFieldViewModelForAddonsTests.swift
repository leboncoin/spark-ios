//
//  TextFieldViewModelForAddonsTests.swift
//  SparkTextFieldUnitTests
//
//  Created by louis.borlee on 01/02/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Testing
import Combine
import UIKit
import SwiftUI
@testable import SparkComponentTextInput
@_spi(SI_SPI) @testable import SparkComponentTextInputTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@MainActor
@Suite("TextField ViewModel For Addons Tests")
final class TextFieldViewModelForAddonsTests {

    // MARK: - Properties

    private let superTests: TextInputUIViewModelTests = .init()
    private var viewModel: TextFieldViewModelForAddons!

    // MARK: - Setup

    init() {

        self.viewModel = .init(
            theme: self.superTests.theme,
            intent: self.superTests.intent,
            getColorsUseCase: self.superTests.getColorsUseCase,
            getBorderLayoutUseCase: self.superTests.getBorderLayoutUseCase,
            getSpacingsUseCase: self.superTests.getSpacingsUseCase
        )
    }

    // MARK: - Tests

    @Test("Init border style")
    func initBorderStyle() {
        #expect(self.viewModel.borderStyle == .none, "Wrong borderStyle")
        #expect(self.viewModel.backgroundColor.equals(ColorTokenDefault.clear), "Wrong backgroundColor")
        #expect(self.viewModel.dim == 1, "Wrong dim")
    }

    @Test("Background color")
    func backgroundColor() {
        self.superTests.publishers.reset()
        self.superTests.resetUseCases()

        #expect(self.viewModel.backgroundColor.equals(ColorTokenDefault.clear), "Wrong viewModel.backgroundColor before set")

        let newColor = ColorTokenGeneratedMock(uiColor: .brown)
        self.viewModel.backgroundColor = newColor

        #expect(self.viewModel.backgroundColor.equals(ColorTokenDefault.clear), "Wrong viewModel.backgroundColor after set")
        #expect(self.viewModel.addonsBackgroundColor.equals(newColor), "Wrong delegate.backgroundColor")

        #expect(!self.superTests.publishers.backgroundColor.sinkCalled, "backgroundColor should not have sinked")
    }

    @Test("Dim")
    func dim() {
        self.superTests.publishers.reset()
        self.superTests.resetUseCases()

        #expect(self.viewModel.dim == 1.0, "Wrong viewModel.dim before set")

        let newDim: CGFloat = 0.2
        self.viewModel.dim = newDim

        #expect(self.viewModel.dim == 1.0, "Wrong viewModel.dim after set")
        #expect(self.viewModel.addonsDim == newDim, "Wrong delegate.dim")

        #expect(!self.superTests.publishers.dim.sinkCalled, "dim should not have sinked")
    }

    @Test("Set border layout")
    func setBorderLayout() throws {
        self.superTests.publishers.reset()
        self.superTests.resetUseCases()

        let newExpectedBorderLayout: TextInputBorderLayout = .mocked(radius: 40, width: 40)
        self.superTests.getBorderLayoutUseCase.executeWithThemeAndBorderStyleAndIsFocusedReturnValue = newExpectedBorderLayout

        // WHEN
        self.viewModel.setBorderLayout()

        // THEN
        #expect(self.viewModel.addonsBorderWidth == newExpectedBorderLayout.width, "Wrong delegate.boderWidth")
        #expect(self.viewModel.addonsBorderRadius == newExpectedBorderLayout.radius, "Wrong delegate.boderRadius")
        // Border with & Radius shouldn't change, the delegate takes charge
        #expect(self.viewModel.borderWidth == self.superTests.expectedBorderLayout.width, "Wrong viewModel.borderRadius")
        #expect(self.viewModel.borderRadius == self.superTests.expectedBorderLayout.radius, "Wrong viewModel.borderWidth")

        #expect(self.superTests.getBorderLayoutUseCase.executeWithThemeAndBorderStyleAndIsFocusedCallsCount == 1, "getBorderLayoutUseCase.executeWithThemeAndBorderStyleAndIsFocused should have been called once")
        let getBorderLayoutReceivedArguments = try #require(self.superTests.getBorderLayoutUseCase.executeWithThemeAndBorderStyleAndIsFocusedReceivedArguments, "Couldn't unwrap getBorderLayoutReceivedArguments")
        #expect(getBorderLayoutReceivedArguments.theme as? ThemeGeneratedMock === self.superTests.theme, "Wrong getBorderLayoutReceivedArguments.theme")
        #expect(getBorderLayoutReceivedArguments.borderStyle == .roundedRect, "Wrong getBorderLayoutReceivedArguments.borderStyle")
        #expect(!getBorderLayoutReceivedArguments.isFocused, "Wrong getBorderLayoutReceivedArguments.isFocused")

        #expect(!self.superTests.publishers.borderWidth.sinkCalled, "$borderWidth should not have been called")
        #expect(!self.superTests.publishers.borderRadius.sinkCalled, "$borderRadius should not have been called")
    }

    @Test("Set spacings")
    func setSpacings() throws {
        self.superTests.publishers.reset()
        self.superTests.resetUseCases()

        let newExpectedSpacings = TextInputSpacings.mocked(horizontal: 2, content: 4)
        self.superTests.getSpacingsUseCase.executeWithThemeAndBorderStyleReturnValue = newExpectedSpacings

        // WHEN
        self.viewModel.setSpacings()

        // THEN
        #expect(self.viewModel.addonsLeftSpacing == newExpectedSpacings.horizontal)
        #expect(self.viewModel.addonsContentSpacing == newExpectedSpacings.content)
        #expect(self.viewModel.addonsRightSpacing == newExpectedSpacings.horizontal)

        // Spacings shouldn't change, the delegate takes charge
        #expect(self.viewModel.leftSpacing == self.superTests.expectedSpacings.horizontal)
        #expect(self.viewModel.contentSpacing == self.superTests.expectedSpacings.content)
        #expect(self.viewModel.rightSpacing == self.superTests.expectedSpacings.horizontal)

        #expect(self.superTests.getSpacingsUseCase.executeWithThemeAndBorderStyleCallsCount == 1, "getSpacingsUseCase.executeWithThemeAndBorderStyle should have been called once")
        let getSpacingsUseCaseReceivedArguments = try #require(self.superTests.getSpacingsUseCase.executeWithThemeAndBorderStyleReceivedArguments, "Couldn't unwrap getSpacingsUseCaseReceivedArguments")
        #expect(getSpacingsUseCaseReceivedArguments.theme as? ThemeGeneratedMock === self.superTests.theme, "Wrong getSpacingsUseCaseReceivedArguments.theme")
        #expect(getSpacingsUseCaseReceivedArguments.borderStyle == .roundedRect, "Wrong getSpacingsUseCaseReceivedArguments.borderStyle")

        #expect(!self.superTests.publishers.leftSpacing.sinkCalled, "$leftSpacing should not have been called")
        #expect(!self.superTests.publishers.contentSpacing.sinkCalled, "$contentSpacing should not have been called")
        #expect(!self.superTests.publishers.rightSpacing.sinkCalled, "$rightSpacing should not have been called")
    }
}
