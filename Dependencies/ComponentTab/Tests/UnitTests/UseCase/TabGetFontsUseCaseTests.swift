//
//  TabGetFontsUseCaseTests.swift
//  SparkComponentTabTests
//
//  Created by robin.lemaire on 23/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentTab
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("Tab Get Fonts Use Case Tests")
struct TabGetFontsUseCaseTests {

    // MARK: - Properties

    let sut: TabGetFontsUseCase
    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = TabGetFontsUseCase()
    }

    // MARK: - Tests

    @Test("Size xSmall is selected false")
    func sizeXSmallIsSelectedFalse() throws {
        // GIVEN / WHEN
        let fonts = sut.execute(theme: self.theme, size: .xSmall, isSelected: false)

        // THEN
        let expectedFonts = TabFonts(
            typographyFontToken: self.theme.typography.caption
        )

        #expect(fonts == expectedFonts)
    }

    @Test("Size xSmall is selected true")
    func sizeXSmallIsSelectedTrue() throws {
        // GIVEN / WHEN
        let fonts = sut.execute(theme: self.theme, size: .xSmall, isSelected: true)

        // THEN
        let expectedFonts = TabFonts(
            typographyFontToken: self.theme.typography.captionHighlight
        )

        #expect(fonts == expectedFonts)
    }

    @Test("Size small is selected false")
    func sizeSmallIsSelectedFalse() throws {
        // GIVEN / WHEN
        let fonts = sut.execute(theme: self.theme, size: .small, isSelected: false)

        // THEN
        let expectedFonts = TabFonts(
            typographyFontToken: self.theme.typography.body2
        )

        #expect(fonts == expectedFonts)
    }

    @Test("Size small is selected true")
    func sizeSmallIsSelectedTrue() throws {
        // GIVEN / WHEN
        let fonts = sut.execute(theme: self.theme, size: .small, isSelected: true)

        // THEN
        let expectedFonts = TabFonts(
            typographyFontToken: self.theme.typography.body2Highlight
        )

        #expect(fonts == expectedFonts)
    }

    @Test("Size medium is selected false")
    func sizeMediumIsSelectedFalse() throws {
        // GIVEN / WHEN
        let fonts = sut.execute(theme: self.theme, size: .medium, isSelected: false)

        // THEN
        let expectedFonts = TabFonts(
            typographyFontToken: self.theme.typography.body1
        )

        #expect(fonts == expectedFonts)
    }

    @Test("Size medium is selected true")
    func sizeMediumIsSelectedTrue() throws {
        // GIVEN / WHEN
        let fonts = sut.execute(theme: self.theme, size: .medium, isSelected: true)

        // THEN
        let expectedFonts = TabFonts(
            typographyFontToken: self.theme.typography.body1Highlight
        )

        #expect(fonts == expectedFonts)
    }
}
