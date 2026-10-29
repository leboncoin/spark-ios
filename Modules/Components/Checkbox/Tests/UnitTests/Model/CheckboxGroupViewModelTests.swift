//
//  CheckboxGroupViewModelTests.swift
//  SparkComponentCheckboxUnitTests
//
//  Created by alican.aycil on 22.01.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Testing
import UIKit
import SwiftUI
@testable import SparkComponentCheckbox
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheming
import SparkTheme

@MainActor
@Suite("Checkbox Group ViewModel Tests")
struct CheckboxGroupViewModelTests {

    let theme: ThemeGeneratedMock
    let checkedImage = IconographyTests.shared.checkmark
    let sut: CheckboxGroupViewModel

    // MARK: - Setup
    init() {
        self.theme = ThemeGeneratedMock.mock
        self.sut = CheckboxGroupViewModel(
            title: "Title",
            checkedImage: Image(uiImage: self.checkedImage),
            theme: self.theme
        )
    }

    // MARK: - Tests
    @Test("Init should set the default values")
    func initialization() throws {

            // Then
            #expect(sut.theme as? ThemeGeneratedMock === self.theme, "Wrong typography value")

            #expect(sut.title == "Title", "text does not match")
            #expect(sut.checkedImage == Image(uiImage: self.checkedImage), "Checked image does not match")
            #expect(sut.alignment == .left, "Alignment does not match")
            #expect(sut.layout == .vertical, "Layout does not match")
            #expect(sut.intent == .main, "Intent does not match")
            #expect(sut.titleFont.uiFont == self.theme.typography.subhead.uiFont, "Title font does not match" )
            #expect(sut.titleColor.uiColor == self.theme.colors.base.onSurface.uiColor, "Title color does not match" )
    }

    @Test("Single checkbox width should be calculated")
    func singleCheckboxWidth() throws {
            // Given
            let text = "This is the way"
            let width: CGFloat = self.calculateCheckboxWidth(string: text)

            // Then
            let viewModelWidth: CGFloat = self.sut.calculateSingleCheckboxWidth(string: text)

            #expect(width == viewModelWidth, "Single checkbox calculation is wrong for SwiftUI Side")
    }

    func calculateCheckboxWidth(string: String?) -> CGFloat {

        let checkboxViewModel = CheckboxViewModel(
            text: .left(NSAttributedString(string: "Text")),
            checkedImage: .left(self.checkedImage),
            theme: self.theme,
            selectionState: .selected
        )

        let spacing: CGFloat = checkboxViewModel.spacing
        let checkboxControlSize: CGFloat = CheckboxView.Constants.checkboxSize
        let font: UIFont = checkboxViewModel.font.uiFont
        let fontAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: font]
        let textSize: CGSize? = (string as? NSString)?.size(withAttributes: fontAttributes)
        let textWidth: CGFloat = textSize?.width ?? 0
        return  checkboxControlSize + spacing + textWidth
    }
}

private extension Theme where Self == ThemeGeneratedMock {
    static var mock: Self {
        let theme = ThemeGeneratedMock()

        theme.colors = ColorsGeneratedMock.mocked()
        theme.layout = LayoutGeneratedMock.mocked()
        theme.dims = DimsGeneratedMock.mocked()
        theme.border = BorderGeneratedMock.mocked()

        let typography = TypographyGeneratedMock()
        typography.body1 = TypographyFontTokenGeneratedMock.mocked(.systemFont(ofSize: 14))
        typography.subhead = TypographyFontTokenGeneratedMock.mocked(.subheadline)
        theme.typography = typography

        return theme
    }
}
