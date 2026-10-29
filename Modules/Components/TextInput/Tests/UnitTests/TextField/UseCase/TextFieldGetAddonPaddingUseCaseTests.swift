//
//  TextFieldGetAddonPaddingUseCaseTests.swift
//  SparkComponentTextInputTests
//
//  Created by robin.lemaire on 20/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI
@testable import SparkComponentTextInput

@MainActor
@Suite("Text Field Get Addon Padding UseCase Tests")
struct TextFieldGetAddonPaddingUseCaseTests {

    // MARK: - Properties

    private var spacings = TextInputSpacings(horizontal: 16)

    // MARK: - Tests - executeLeft

    @Test("Execute left when has padding is false should return zero insets")
    func executeLeftWhenHasPaddingIsFalseShouldReturnZeroInsets() {
        // GIVEN
        let useCase = TextFieldGetAddonPaddingUseCase()
        let configuration = TextFieldAddonConfiguration(
            hasPadding: false,
            hasSeparator: true
        )

        // WHEN
        let result = useCase.executeLeft(
            spacings: self.spacings,
            configuration: configuration
        )

        // THEN
        #expect(result == .zero)
    }

    @Test("Execute left when has padding is true and has separator is true should return correct insets")
    func executeLeftWhenHasPaddingIsTrueAndHasSeparatorIsTrueShouldReturnCorrectInsets() {
        // GIVEN
        let useCase = TextFieldGetAddonPaddingUseCase()
        let configuration = TextFieldAddonConfiguration(
            hasPadding: true,
            hasSeparator: true
        )

        // WHEN
        let result = useCase.executeLeft(
            spacings: self.spacings,
            configuration: configuration
        )

        // THEN
        #expect(result.top == 0, "Wrong top value")
        #expect(result.leading == self.spacings.horizontal, "Wrong top value")
        #expect(result.bottom == 0, "Wrong top value")
        #expect(result.trailing == self.spacings.horizontal, "Wrong trailing value")
    }

    @Test("Execute left when has padding is true and has separator is false should return correct insets")
    func executeLeftWhenHasPaddingIsTrueAndHasSeparatorIsFalseShouldReturnCorrectInsets() {
        // GIVEN
        let useCase = TextFieldGetAddonPaddingUseCase()
        let configuration = TextFieldAddonConfiguration(
            hasPadding: true,
            hasSeparator: false
        )

        // WHEN
        let result = useCase.executeLeft(
            spacings: self.spacings,
            configuration: configuration
        )

        // THEN
        #expect(result.top == 0, "Wrong top value")
        #expect(result.leading == self.spacings.horizontal, "Wrong top value")
        #expect(result.bottom == 0, "Wrong top value")
        #expect(result.trailing == 0, "Wrong trailing value")
    }

    // MARK: - Tests - executeRight

    @Test("Execute right when has padding is false should return zero insets")
    func executeRightWhenHasPaddingIsFalseShouldReturnZeroInsets() {
        // GIVEN
        let useCase = TextFieldGetAddonPaddingUseCase()
        let configuration = TextFieldAddonConfiguration(
            hasPadding: false,
            hasSeparator: true
        )

        // WHEN
        let result = useCase.executeRight(
            spacings: self.spacings,
            configuration: configuration
        )

        // THEN
        #expect(result == .zero)
    }

    @Test("Execute right when has padding is true and has separator is true should return correct insets")
    func executeRightWhenHasPaddingIsTrueAndHasSeparatorIsTrueShouldReturnCorrectInsets() {
        // GIVEN
        let useCase = TextFieldGetAddonPaddingUseCase()
        let configuration = TextFieldAddonConfiguration(
            hasPadding: true,
            hasSeparator: true
        )

        // WHEN
        let result = useCase.executeRight(
            spacings: self.spacings,
            configuration: configuration
        )

        // THEN
        #expect(result.top == 0, "Wrong top value")
        #expect(result.leading == self.spacings.horizontal, "Wrong top value")
        #expect(result.bottom == 0, "Wrong top value")
        #expect(result.trailing == self.spacings.horizontal, "Wrong trailing value")
    }

    @Test("Execute right when has padding is true and has separator is false should return correct insets")
    func executeRightWhenHasPaddingIsTrueAndHasSeparatorIsFalseShouldReturnCorrectInsets() {
        // GIVEN
        let useCase = TextFieldGetAddonPaddingUseCase()
        let configuration = TextFieldAddonConfiguration(
            hasPadding: true,
            hasSeparator: false
        )

        // WHEN
        let result = useCase.executeRight(
            spacings: self.spacings,
            configuration: configuration
        )

        // THEN
        #expect(result.top == 0, "Wrong top value")
        #expect(result.leading == 0, "Wrong top value")
        #expect(result.bottom == 0, "Wrong top value")
        #expect(result.trailing == self.spacings.horizontal, "Wrong trailing value")
    }
}

// MARK: - Extensions

private extension EdgeInsets {

    static var zero: Self {
        .init(top: 0, leading: 0, bottom: 0, trailing: 0)
    }
}
