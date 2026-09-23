//
//  ButtonGetBorderUseCaseTests.swift
//  SparkComponentButtonTests
//
//  Created by robin.lemaire on 27/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentButton
@_spi(SI_SPI) @testable import SparkComponentButtonTesting
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("Button Get Border Use Case Tests")
struct ButtonGetBorderUseCaseTests {

    // MARK: - Properties

    let sut: ButtonGetBorderUseCase
    let theme: ThemeGeneratedMock
    let getAppearanceUseCase: ButtonGetAppearanceUseCaseableGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.getAppearanceUseCase = .init()
        self.sut = ButtonGetBorderUseCase(getAppearanceUseCase: self.getAppearanceUseCase)
    }

    // MARK: - Tests

    // MARK: Deprecated execute with appearance parameter

    @Test("Deprecated execute with appearance and removeStyles true")
    func deprecatedExecuteWithAppearanceAndRemoveStylesTrue() throws {
        // GIVEN
        self.getAppearanceUseCase.executeWithAppearanceAndIntentAndVariantReturnValue = .primary

        // WHEN
        let border = self.sut.execute(
            theme: self.theme,
            appearance: .primary,
            intent: .main,
            shape: .rounded,
            variant: .filled,
            removeStyles: true
        )

        // THEN
        #expect(border.width == 0)
        #expect(border.radius == 0)
        ButtonGetAppearanceUseCaseableMockTest.expect(
            self.getAppearanceUseCase,
            expectedNumberOfCalls: 1,
            givenAppearance: .primary,
            givenIntent: .main,
            givenVariant: .filled,
            expectedReturnValue: .primary
        )
    }

    @Test("Deprecated execute with appearance and removeStyles false")
    func deprecatedExecuteWithAppearanceAndRemoveStylesFalse() throws {
        // GIVEN
        self.getAppearanceUseCase.executeWithAppearanceAndIntentAndVariantReturnValue = .primary

        // WHEN
        let border = self.sut.execute(
            theme: self.theme,
            appearance: .primary,
            intent: .main,
            shape: .rounded,
            variant: .filled,
            removeStyles: false
        )

        // THEN
        #expect(border.width == 0)
        #expect(border.radius == self.theme.border.radius.full)
        ButtonGetAppearanceUseCaseableMockTest.expect(
            self.getAppearanceUseCase,
            expectedNumberOfCalls: 1,
            givenAppearance: .primary,
            givenIntent: .main,
            givenVariant: .filled,
            expectedReturnValue: .primary
        )
    }

    @Test("Deprecated execute with nil appearance and outlined variant and removeStyles false")
    func deprecatedExecuteWithNilAppearanceAndOutlinedVariantAndRemoveStylesFalse() throws {
        // GIVEN
        self.getAppearanceUseCase.executeWithAppearanceAndIntentAndVariantReturnValue = nil

        // WHEN
        let border = self.sut.execute(
            theme: self.theme,
            appearance: nil,
            intent: .main,
            shape: .rounded,
            variant: .outlined,
            removeStyles: false
        )

        // THEN
        #expect(border.width == self.theme.border.width.small)
        #expect(border.radius == self.theme.border.radius.full)
        ButtonGetAppearanceUseCaseableMockTest.expect(
            self.getAppearanceUseCase,
            expectedNumberOfCalls: 1,
            givenIntent: .main,
            givenVariant: .outlined,
            expectedReturnValue: nil
        )
    }

    @Test("Deprecated execute with nil appearance and filled variant and removeStyles false")
    func deprecatedExecuteWithNilAppearanceAndFilledVariantAndRemoveStylesFalse() throws {
        // GIVEN
        self.getAppearanceUseCase.executeWithAppearanceAndIntentAndVariantReturnValue = nil

        // WHEN
        let border = self.sut.execute(
            theme: self.theme,
            appearance: nil,
            intent: .main,
            shape: .rounded,
            variant: .filled,
            removeStyles: false
        )

        // THEN
        #expect(border.width == 0)
        #expect(border.radius == self.theme.border.radius.full)
        ButtonGetAppearanceUseCaseableMockTest.expect(
            self.getAppearanceUseCase,
            expectedNumberOfCalls: 1,
            givenIntent: .main,
            givenVariant: .filled,
            expectedReturnValue: nil
        )
    }

    @Test("Deprecated execute with nil appearance and removeStyles true")
    func deprecatedExecuteWithNilAppearanceAndRemoveStylesTrue() throws {
        // GIVEN
        self.getAppearanceUseCase.executeWithAppearanceAndIntentAndVariantReturnValue = nil

        // WHEN
        let border = self.sut.execute(
            theme: self.theme,
            appearance: nil,
            intent: .main,
            shape: .rounded,
            variant: .filled,
            removeStyles: true
        )

        // THEN
        #expect(border.width == 0)
        #expect(border.radius == 0)
        ButtonGetAppearanceUseCaseableMockTest.expect(
            self.getAppearanceUseCase,
            expectedNumberOfCalls: 1,
            givenIntent: .main,
            givenVariant: .filled,
            expectedReturnValue: nil
        )
    }

    // MARK: New execute with appearance parameter

    @Test(
        "Execute with appearances that have no border",
        arguments: [
            ButtonAppearance.primary,
            ButtonAppearance.secondary,
            ButtonAppearance.contrast,
            ButtonAppearance.ghost,
            ButtonAppearance.boost
        ]
    )
    func executeWithAppearancesThatHaveNoBorder(appearance: ButtonAppearance) throws {
        // WHEN
        let border = self.sut.execute(
            theme: self.theme,
            appearance: appearance,
            removeStyles: false
        )

        // THEN
        #expect(border.width == 0)
        #expect(border.radius == self.theme.border.radius.full)
    }

    @Test(
        "Execute with appearances that have border",
        arguments: [
            ButtonAppearance.tertiary,
            ButtonAppearance.success,
            ButtonAppearance.danger,
            ButtonAppearance.ai
        ]
    )
    func executeWithAppearancesThatHaveBorder(appearance: ButtonAppearance) throws {
        // WHEN
        let border = self.sut.execute(
            theme: self.theme,
            appearance: appearance,
            removeStyles: false
        )

        // THEN
        #expect(border.width == self.theme.border.width.small)
        #expect(border.radius == self.theme.border.radius.full)
    }

    @Test("Execute with any appearance and removeStyles true")
    func executeWithAnyAppearanceAndRemoveStylesTrue() throws {
        // WHEN
        let border = self.sut.execute(
            theme: self.theme,
            appearance: .primary,
            removeStyles: true
        )

        // THEN
        #expect(border.width == 0)
        #expect(border.radius == 0)
    }
}
