//
//  CheckboxViewModelTests.swift
//  SparkComponentCheckbox
//
//  Created by janniklas.freundt.ext on 17.04.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Combine
import SwiftUI
import Testing
@testable import SparkComponentCheckbox
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheming
import SparkTheme

// swiftlint:disable force_unwrapping
@MainActor
@Suite("Checkbox ViewModel Tests")
final class CheckboxViewModelTests {

    let theme: ThemeGeneratedMock
    var cancellable = Set<AnyCancellable>()
    let checkedImage = IconographyTests.shared.checkmark

    // MARK: - Setup
    init() {
        self.theme = ThemeGeneratedMock.mocked()
    }

    // MARK: - Tests
    @Test("Init should set the values for each state")
    func initialization() throws {
        let states = [true, false]

        for state in states {
            // Given
            let viewModel = sut(isEnabled: state)

            // Then
            #expect(state == viewModel.isEnabled, "wrong state")
            #expect(viewModel.theme != nil, "no theme set")
            #expect(viewModel.colors != nil, "no colors set")
            #expect(viewModel.intent != nil, "no intents set")
            #expect(viewModel.alignment != nil, "no alignment set")

            #expect(viewModel.theme as? ThemeGeneratedMock === self.theme, "Wrong typography value")

            #expect(viewModel.text.leftValue?.string == "Text", "text does not match")
            #expect(viewModel.checkedImage.leftValue == self.checkedImage, "Checked image does not match")
            #expect(viewModel.alignment == .left, "Alignment does not match")
            #expect(viewModel.intent == .main, "Intent does not match")
            #expect(viewModel.selectionState == .unselected, "Selection state does not match")
        }
    }

    @Test("Opacity should depend on the enabled state")
    func opacity() throws {
        // Given
        let opacities = self.sutValues(for: \.opacity)

        // Then
        #expect(opacities == [self.theme.dims.none, self.theme.dims.dim3])
    }

    @Test("IsEnabled should match the given state")
    func isEnabled() {
        // Given
        let disabledStates = self.sutValues(for: \.isEnabled)

        // Then
        #expect(disabledStates == [true, false])
    }

    @Test("Text should be set with a string")
    func text() {
        // Given
        let sut = self.sut(isEnabled: true, attributeText: NSAttributedString("Text"))

        // When
        sut.text = .right("Text")

        // Then
        #expect(sut.text.rightValue != nil)
    }

    @Test("Text should be set with an attributed string")
    func attributeText() {
        // Given
        let sut = self.sut(isEnabled: true)

        // When
        sut.text = .left(NSAttributedString("Text"))

        // Then
        #expect(sut.text.leftValue != nil)
    }

    @Test("Colors should be updated after the intent is set")
    func updateColorsMethodAfterIntentIsSet() async {
        // Given
        let sut = self.sut(isEnabled: true, attributeText: NSAttributedString("Text"))
        var isColorsUpdated = false
        // When
        sut.intent = .accent

        await confirmation("Colors are updates") { confirm in
            sut.$colors.sink(receiveValue: { _ in
                isColorsUpdated = true
                confirm()
            })
            .store(in: &cancellable)
        }

        // Then
        #expect(isColorsUpdated)
    }

    // MARK: - Private Helper Functions
    private func sutValues<T>(for keyPath: KeyPath<CheckboxViewModel, T>) -> [T] {
        // Given
        let statesToTest: [Bool] = [true, false]

        return statesToTest
            .map { self.sut(isEnabled: $0) }
            .map { $0[keyPath: keyPath] }
    }

    private func sut(isEnabled: Bool, attributeText: NSAttributedString? = nil) -> CheckboxViewModel {
        return CheckboxViewModel(
            text: attributeText == nil ? .left(NSAttributedString("Text")) : .left(attributeText!),
            checkedImage: .left(self.checkedImage),
            theme: self.theme,
            isEnabled: isEnabled,
            selectionState: .unselected
        )
    }
}

private extension Theme where Self == ThemeGeneratedMock {
    static var mock: Self {
        let theme = ThemeGeneratedMock()
        let colors = ColorsGeneratedMock()

        colors.base = ColorsBaseGeneratedMock.mocked()
        colors.main = ColorsMainGeneratedMock.mocked()
        colors.feedback = ColorsFeedbackGeneratedMock.mocked()
        theme.colors = colors
        theme.dims = DimsGeneratedMock.mocked()

        return theme
    }
}
