//
//  RadioButtonViewModelTests.swift
//  SparkComponentRadioButtonTests
//
//  Created by michael.zimmermann on 13.04.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Combine
@testable import SparkComponentRadioButton
@_spi(SI_SPI) import SparkCommon
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import SwiftUI
import Testing

@MainActor
@Suite("RadioButton ViewModel Tests")
final class RadioButtonViewModelTests {

    // MARK: - Properties
    let theme: ThemeGeneratedMock
    var bindingValue: Int? = 0
    var subscriptions = Set<AnyCancellable>()

    // MARK: - Setup
    init() {
        // Given
        self.theme = ThemeGeneratedMock.mocked()
    }

    // MARK: - Tests
    @Test("Opacity should be full when enabled")
    func opacityForEnabled() throws {
        // Given
        let sut = self.sut(intent: .support)

        // When
        sut.set(enabled: true)
        let opacity = sut.opacity

        // Then
        #expect(opacity == 1.00)
    }

    @Test("Opacity should be dimmed when disabled")
    func opacityForDisabled() throws {
        // Given
        let sut = self.sut(intent: .support)

        // When
        sut.set(enabled: false)
        let opacity = sut.opacity

        // Then
        #expect(opacity == 0.40)
    }

    @Test("Colors should be reset when the selected value is set")
    func colorsResetWhenSelectedValueSet() async {
        // Given
        let sut = self.sut(intent: .support)

        await confirmation("Colors published when selection changes.", expectedCount: 2...) { confirm in
            sut.$colors.sink(receiveValue: { _ in
                confirm()
            })
            .store(in: &self.subscriptions)

            // When
            sut.set(selected: true)
        }

        // Then
        #expect(self.bindingValue == 1)
    }

    @Test("Theme update should publish changed values")
    func themeUpdatePublishesChangedValues() async {
        // Given
        let sut = self.sut(intent: .support)

        await confirmation("Changes to theme publishes value changes.", expectedCount: 2...) { confirm in
            let publishers = Publishers.Zip4(sut.$opacity, sut.$spacing, sut.$font, sut.$colors)

            Publishers.Zip(publishers, sut.$colors)
                .sink { _ in
                    confirm()
                }
                .store(in: &self.subscriptions)

            // When
            sut.set(theme: ThemeGeneratedMock.mocked())
        }
    }

    @Test("State update should publish changed values")
    func stateUpdatePublishesChangedValues() async {
        // Given
        let sut = self.sut(intent: .support)

        await confirmation("Changes to state publishes value changes.", expectedCount: 2...) { confirm in
            Publishers.Zip(sut.$isDisabled, sut.$colors)
                .sink { _ in
                    confirm()
                }
                .store(in: &self.subscriptions)

            // When
            sut.set(enabled: false)
        }
    }

    @Test("Spacing update should publish changed values")
    func spacingUpdatePublishesChangedValues() async {
        // Given
        let sut = self.sut(intent: .support)
        var spacings = Set<CGFloat>()

        await confirmation("Changes to label position publishes value changes.", expectedCount: 2...) { confirm in
            sut.$spacing.sink { spacing in
                spacings.insert(spacing)
                confirm()
            }
            .store(in: &self.subscriptions)

            // When
            sut.set(alignment: .leading)
        }

        // Then
        #expect(spacings == [self.theme.layout.spacing.medium])
    }

    // MARK: - Private Helper Functions

    private func sutValues<T>(for keyPath: KeyPath<RadioButtonViewModel<Int>, T>) -> [T] {
        return RadioButtonIntent.allCases
            .map(self.sut(intent:))
            .map { $0[keyPath: keyPath] }
    }

    private func sut(intent: RadioButtonIntent) -> RadioButtonViewModel<Int> {
        let seletedId = Binding(
            get: { self.bindingValue },
            set: { self.bindingValue = $0 }
        )

        return RadioButtonViewModel(
            theme: self.theme,
            intent: intent,
            id: 1,
            label: .right("Test"),
            selectedID: seletedId)
    }
}

private extension Theme where Self == ThemeGeneratedMock {
    static func mocked() -> Self {
        let theme = ThemeGeneratedMock()
        let colors = ColorsGeneratedMock.mocked()
        let layout = LayoutGeneratedMock.mocked()
        let dims = DimsGeneratedMock.mocked()
        let typography = TypographyGeneratedMock.mocked()

        theme.colors = colors
        theme.layout = layout
        theme.typography = typography
        theme.dims = dims

        return theme
    }
}
