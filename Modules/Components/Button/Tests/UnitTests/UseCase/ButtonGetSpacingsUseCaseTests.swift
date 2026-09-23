//
//  ButtonGetSpacingsUseCaseTests.swift
//  SparkComponentButtonTests
//
//  Created by robin.lemaire on 11/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentButton
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("Button Get Spacings Use Case Tests")
struct ButtonGetSpacingsUseCaseTests {

    // MARK: - Properties

    let sut: ButtonGetSpacingsUseCase
    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = ButtonGetSpacingsUseCase()
    }

    // MARK: - Tests

    @Test("Type button contentVisibility showAll")
    func typeButtonContentVisibilityShowAll() throws {
        // GIVEN / WHEN
        let layout = self.sut.execute(
            theme: self.theme,
            type: .button,
            contentVisibility: .showAll
        )

        // THEN
        let expectedLayout = ButtonLayout(
            horizontalSpacing: self.theme.layout.spacing.medium,
            horizontalPadding: self.theme.layout.spacing.large
        )

        #expect(layout == expectedLayout)
    }

    @Test("Type button contentVisibility hideImage")
    func typeButtonContentVisibilityHideImage() throws {
        // GIVEN / WHEN
        let layout = self.sut.execute(
            theme: self.theme,
            type: .button,
            contentVisibility: .hideImage
        )

        // THEN
        let expectedLayout = ButtonLayout(
            horizontalSpacing: self.theme.layout.spacing.medium,
            horizontalPadding: self.theme.layout.spacing.large
        )

        #expect(layout == expectedLayout)
    }

    @Test("Type button contentVisibility hideLabel")
    func typeButtonContentVisibilityHideLabel() throws {
        // GIVEN / WHEN
        let layout = self.sut.execute(
            theme: self.theme,
            type: .button,
            contentVisibility: .hideLabel
        )

        // THEN
        let expectedLayout = ButtonLayout(
            horizontalSpacing: self.theme.layout.spacing.medium,
            horizontalPadding: self.theme.layout.spacing.none
        )

        #expect(layout == expectedLayout)
    }

    @Test("Type iconButton contentVisibility showAll")
    func typeIconButtonContentVisibilityShowAll() throws {
        // GIVEN / WHEN
        let layout = self.sut.execute(
            theme: self.theme,
            type: .iconButton,
            contentVisibility: .showAll
        )

        // THEN
        let expectedLayout = ButtonLayout(
            horizontalSpacing: self.theme.layout.spacing.medium,
            horizontalPadding: self.theme.layout.spacing.none
        )

        #expect(layout == expectedLayout)
    }

    @Test("Type iconButton contentVisibility hideImage")
    func typeIconButtonContentVisibilityHideImage() throws {
        // GIVEN / WHEN
        let layout = self.sut.execute(
            theme: self.theme,
            type: .iconButton,
            contentVisibility: .hideImage
        )

        // THEN
        let expectedLayout = ButtonLayout(
            horizontalSpacing: self.theme.layout.spacing.medium,
            horizontalPadding: self.theme.layout.spacing.none
        )

        #expect(layout == expectedLayout)
    }

    @Test("Type iconButton contentVisibility hideLabel")
    func typeIconButtonContentVisibilityHideLabel() throws {
        // GIVEN / WHEN
        let layout = self.sut.execute(
            theme: self.theme,
            type: .iconButton,
            contentVisibility: .hideLabel
        )

        // THEN
        let expectedLayout = ButtonLayout(
            horizontalSpacing: self.theme.layout.spacing.medium,
            horizontalPadding: self.theme.layout.spacing.none
        )

        #expect(layout == expectedLayout)
    }
}
